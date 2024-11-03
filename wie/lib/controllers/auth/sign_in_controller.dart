import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:local_auth/local_auth.dart';
import 'package:wie/view/auth/sign_up.dart';

import 'package:wie/view/slides/slide_right.dart';
import 'package:wie/view/startscreen.dart';
// import 'package:wie/view/startscreen.dart';

abstract class SignInController extends GetxController {
  hidepaasword();
  gotosignup(BuildContext context);
  signin(String email, String password);
  forgetpassword(String email);
  signInWithGoogle(context);
}

class SignInControllerImp extends SignInController {
  bool ispasswordhidden = true;
  bool isloading1 = false;
  bool isloading2 = false;
  bool isloading3 = false;

  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  GlobalKey<FormState> formStateSignIn = GlobalKey<FormState>();

  final LocalAuthentication auth = LocalAuthentication();
  bool supportstate = false;

  @override
  hidepaasword() {
    ispasswordhidden = !ispasswordhidden;
    update();
  }

  @override
  gotosignup(BuildContext context) {
    Navigator.of(context).pushReplacement(
      SlideRight(
        page: const SignUp(),
      ),
    );
  }

  @override
  void onInit() {
    auth.isDeviceSupported().then(
          (bool issupported) => supportstate = issupported,
        );
    super.onInit();
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  signin(String email, String password) async {
    //try {
    //   isloading1 = true;
    //   update();
    //   final credential = await FirebaseAuth.instance
    //       .signInWithEmailAndPassword(email: email, password: password);
    //   DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
    //       .collection('users')
    //       .doc(credential.user!.uid)
    //       .get();
    //   var userData = docSnapshot.data();
    //   await secureStorage.write(
    //     key: "email",
    //     value: email,
    //   );

    //   await secureStorage.write(
    //     key: "userid",
    //     value: credential.user!.uid,
    //   );
    //   await secureStorage.write(
    //     key: "password",
    //     value: password,
    //   );

    //   isloading1 = false;
    //   update();
    //   if (credential.user!.emailVerified) {
    //     if (docSnapshot.exists) {
    //       if (userData is Map<String, dynamic>) {
    //         await secureStorage.write(
    //           key: "username",
    //           value: userData['name'],
    //         );
    //         if (userData['isadmin'] == true) {
    //           Get.offAllNamed("/adminscreen");
    //           await secureStorage.write(
    //             key: "isadmin",
    //             value: "1",
    //           );
    //         } else {
    //           Get.offAllNamed("/start");
    //           await secureStorage.write(
    //             key: "isadmin",
    //             value: "0",
    //           );
    //         }
    //       }
    //     } else {
    //       Get.offAllNamed("/start");

    //       await secureStorage.write(
    //         key: "isadmin",
    //         value: "0",
    //       );
    //     }
    //   } else {
    //     return Get.rawSnackbar(
    //         title: "Verify Your Account",
    //         message: "An email was send to you. Please verify your Account",
    //         backgroundColor: Colors.red);
    //   }
    // } on FirebaseAuthException catch (e) {
    //   isloading1 = false;
    //   update();
    //   if (e.code == 'user-not-found') {
    //     return Get.rawSnackbar(
    //         title: "user-not-found",
    //         message: "No user found for that email. Please Sign up",
    //         backgroundColor: Colors.red);
    //   } else if (e.code == 'wrong-password') {
    //     return Get.rawSnackbar(
    //         title: "Wrong password",
    //         message: "Wrong password provided for that user.",
    //         backgroundColor: Colors.red);
    //   } else {
    //     return Get.rawSnackbar(
    //         title: "Error",
    //         message: "Please try again",
    //         backgroundColor: Colors.red);
    //   }
    //}
  }

  @override
  forgetpassword(String email) async {
    try {
      isloading2 = true;
      update();
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      isloading2 = false;
      update();
      return Get.rawSnackbar(
          title: "Reset Password",
          message: "An email was send to you. Please Reset your password !",
          backgroundColor: Colors.pink);
    } catch (e) {
      return Get.rawSnackbar(
          title: "Error",
          message: "Email not found. Please try again",
          backgroundColor: Colors.red);
    }
  }

  @override
  Future signInWithGoogle(context) async {
    try {
      isloading3 = true;
      update();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return Get.rawSnackbar(
            title: "Google Sign in", message: "no account selected ");
      } else {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
        Get.offAll(()=>const StartPage());
      }
    } catch (e) {
      isloading3 = false;
      update();
      return Get.rawSnackbar(title: "Error", message: "Please try again");
    }
  }
}

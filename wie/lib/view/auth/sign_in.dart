import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:wie/controllers/auth/sign_in_controller.dart';
import 'package:wie/view/auth/authwidgets/button_auth.dart';
import 'package:wie/view/auth/authwidgets/common_row_down.dart';
import 'package:wie/view/auth/authwidgets/common_text_auth.dart';
import 'package:wie/view/auth/authwidgets/textfieldauth.dart';
import 'package:wie/view/commonwidgets/commonloading.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    SignInControllerImp controller = Get.put(SignInControllerImp());
    return Scaffold(
      backgroundColor: const Color.fromARGB(214, 239, 74, 129),
      body: Form(
        key: controller.formStateSignIn,
        child: SafeArea(
          child: ListView(
            children: [
              const Commonauthtextsign(
                textsign: "Sign In",
              ),
              GetBuilder<SignInControllerImp>(
                builder: (controller) => Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 10.0),
                        child: FadeInRight(
                          duration: const Duration(seconds: 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome Back",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.mulish(
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(214, 239, 74, 129),
                                ),
                              ),
                              Image.asset(
                                "assets/images/applogo.png",
                                height: 50.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: FadeInRight(
                          duration: const Duration(milliseconds: 800),
                          child: Text(
                            "Hello there,sign in to continue",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.mulish(
                              fontSize: 17.0,
                              color: const Color.fromARGB(255, 10, 135, 96),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Center(
                        child: FadeInLeft(
                          duration: const Duration(milliseconds: 800),
                          child: Image.asset(
                            "assets/images/signin.png",
                            height: 200.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: FadeInRight(
                          duration: const Duration(milliseconds: 800),
                          child: TextFieldAuth(
                            hint: "Email",
                            readonly: false,
                            mytype: TextInputType.emailAddress,
                            mycontroller: controller.emailcontroller,
                            myicon: const Icon(
                              LineIcons.user,
                              color: Color.fromARGB(200, 0, 0, 0),
                            ),
                            ispass: false,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Can't to be empty ";
                              } else if (!RegExp(
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(val)) {
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: FadeInLeft(
                          duration: const Duration(milliseconds: 800),
                          child: TextFieldAuth(
                            hint: "Password",
                            readonly: false,
                            mytype: TextInputType.text,
                            mycontroller: controller.passwordcontroller,
                            mysuffixicon: GestureDetector(
                              onTap: () {
                                controller.hidepaasword();
                              },
                              child: Icon(
                                controller.ispasswordhidden
                                    ? LineIcons.eyeSlash
                                    // ignore: dead_code
                                    : LineIcons.eye,
                                color: const Color.fromARGB(200, 0, 0, 0),
                              ),
                            ),
                            myicon: const Icon(
                              LineIcons.key,
                              color: Color.fromARGB(200, 0, 0, 0),
                            ),
                            ispass: controller.ispasswordhidden,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Can't to be empty ";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      controller.isloading2
                          ? const CommonLoading()
                          : InkWell(
                              onTap: () {
                                if (controller.emailcontroller.text == "" ||
                                    controller.emailcontroller.text.isEmpty) {
                                  Get.rawSnackbar(
                                      title: "Error",
                                      message: "Please write your email",
                                      backgroundColor: Colors.red);
                                } else {
                                  controller.forgetpassword(
                                      controller.emailcontroller.text);
                                }
                              },
                              child: FadeInLeft(
                                duration: const Duration(milliseconds: 800),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 1.7,
                                    top: 10.0,
                                  ),
                                  child: const Text(
                                    "Forget Password ?",
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      color: Color.fromARGB(163, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      const SizedBox(height: 25.0),
                      controller.isloading1
                          ? const CommonLoading()
                          : FadeInRight(
                              duration: const Duration(milliseconds: 900),
                              child: ButtonAuth(
                                mytitle: "Sign In",
                                myfunction: () {
                                  if (controller.formStateSignIn.currentState!
                                      .validate()) {
                                    controller.signin(
                                        controller.emailcontroller.text,
                                        controller.passwordcontroller.text);
                                  }
                                },
                              ),
                            ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      controller.isloading3
                          ? const CommonLoading()
                          : TextButton.icon(
                              label: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Or continue with",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.mulish(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(147, 0, 0, 0),
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/google.png",
                                    height: 50.0,
                                  ),
                                ],
                              ),
                              onPressed: () {
                                controller.signInWithGoogle(context);
                              },
                            ),
                      const Spacer(),
                      CommonRowDown(
                        onTap: () => controller.gotosignup(context),
                        textrowone: "Don't have an account?  ",
                        textrowtwo: "Sign Up",
                      ),
                      const SizedBox(
                        height: 10.0,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:wie/view/auth/sign_in.dart';
import 'package:wie/view/auth/sign_up.dart';
import 'package:wie/view/onboarding/onboarding_container.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'Register',
      finishButtonTextStyle: GoogleFonts.mulish(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      skipIcon: const Icon(
        LineIcons.arrowRight,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      onFinish: () {
        Get.offAll(() => const SignUp());
      },
      finishButtonStyle: const FinishButtonStyle(
        backgroundColor: Color.fromARGB(214, 239, 74, 129),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
      ),
      skipTextButton: Text(
        'Skip',
        style: GoogleFonts.mulish(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(214, 239, 74, 129),
        ),
      ),
      trailing: Text(
        'Login',
        style: GoogleFonts.mulish(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(214, 239, 74, 129),
        ),
      ),
      trailingFunction: () {
        Get.offAll(() => const SignIn());
      },
      controllerColor: const Color.fromARGB(145, 0, 0, 0),
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      background: [
        Lottie.asset(
          'assets/lotties/onboarding2.json',
          height: MediaQuery.of(context).size.height * 0.4,
        ),
        Lottie.asset(
          'assets/lotties/onboarding1.json',
          height: MediaQuery.of(context).size.height * 0.4,
        ),
        Lottie.asset(
          'assets/lotties/onboarding3.json',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
        ),
      ],
      speed: 1.8,
      pageBodies: const [
        Onboardingcontainer(
          textone: 'Welcome',
          texttwo: 'To Fortes Feminae',
        ),
        Onboardingcontainer(
          textone: 'On your way...',
          texttwo: 'To find the perfect e-learning platform?',
        ),
        Onboardingcontainer(
          textone: 'Start now!',
          texttwo: 'Where everything is possible !',
        ),
      ],
    );
  }
}

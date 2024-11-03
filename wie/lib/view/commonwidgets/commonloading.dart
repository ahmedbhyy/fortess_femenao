import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CommonLoading extends StatelessWidget {
  const CommonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Lottie.asset("assets/lotties/lottie_loading2.json", height: 80.0),
    );
  }
}

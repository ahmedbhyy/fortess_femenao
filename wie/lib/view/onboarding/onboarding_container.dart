import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboardingcontainer extends StatelessWidget {
  final String textone;
  final String texttwo;
  const Onboardingcontainer(
      {super.key, required this.textone, required this.texttwo});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 400,
          ),
          Text(
            textone,
            textAlign: TextAlign.center,
            style: GoogleFonts.mulish(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(200, 0, 0, 0),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            texttwo,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromARGB(139, 3, 3, 3),
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

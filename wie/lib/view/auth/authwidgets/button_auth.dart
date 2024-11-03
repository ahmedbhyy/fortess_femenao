import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonAuth extends StatelessWidget {
  final String mytitle;
  final void Function()? myfunction;
  const ButtonAuth(
      {super.key, required this.mytitle, required this.myfunction});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        padding: const EdgeInsets.all(8),
        color: const Color.fromARGB(214, 239, 74, 129),
        onPressed: myfunction,
        minWidth: 250.0,
        elevation: 6,
        shape: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(67, 0, 0, 0),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          mytitle,
          style: GoogleFonts.mulish(
            fontSize: 22,
            color: const Color.fromARGB(232, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

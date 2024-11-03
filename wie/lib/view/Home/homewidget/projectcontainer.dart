import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectContainer extends StatelessWidget {
  final String text1;
  final String text2;
  final Icon myicon;
  const ProjectContainer(
      {super.key,
      required this.text1,
      required this.text2,
      required this.myicon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: const Color.fromARGB(214, 239, 74, 129),
          ),
          child: myicon,
        ),
        const SizedBox(
          width: 15.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text1,
              style: GoogleFonts.mulish(
                fontSize: 11.0,
                color: Colors.white,
              ),
            ),
            Text(
              text2,
              style: GoogleFonts.mulish(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 235, 65, 122),
              ),
            ),
          ],
        )
      ],
    );
  }
}

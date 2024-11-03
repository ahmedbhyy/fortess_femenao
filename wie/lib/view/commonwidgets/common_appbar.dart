import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonAppBar extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const CommonAppBar({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: GoogleFonts.mulish(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(200, 0, 0, 0),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Image.asset(
            "assets/images/applogo.png",
            height: 50.0,
          ),
        ),
      ],
      scrolledUnderElevation: 0,
      backgroundColor: const Color(0xfff7f6fa),
      centerTitle: true,
      leading: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.arrow_back_ios_new),
        color: const Color.fromARGB(213, 0, 0, 0),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:wie/view/Home/notifications.dart';
import 'package:wie/view/slides/slide_right.dart';

class CommonWelcomeMember extends StatelessWidget {
  final String membername;
  const CommonWelcomeMember({super.key, required this.membername});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome 💓",
                textAlign: TextAlign.start,
                style: GoogleFonts.aBeeZee(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(200, 0, 0, 0),
                ),
              ),
              Text(
                membername,
                textAlign: TextAlign.start,
                style: GoogleFonts.mulish(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(175, 0, 0, 0),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 35.0,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(150, 228, 224, 224)),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      SlideRight(
                        page: NotificationsScreen(),
                      ),
                    );
                  },
                  icon: const Icon(LineIcons.bell),
                  iconSize: 20.0,
                  color: const Color.fromARGB(200, 0, 0, 0),
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Image.asset(
                "assets/images/applogo.png",
                height: 50.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

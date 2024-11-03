import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class CourseOwnerController extends GetxController {
  launchurlowner(String url);
  updatefavorite(bool isfavoriteselected, String ownername);
}

class CourseOwnerControllerImp extends CourseOwnerController {
  bool isfavorite = false;

  @override
  updatefavorite(bool isfavoriteselected, String ownername) {
    isfavorite = isfavoriteselected;
    isfavorite
        ? Get.rawSnackbar(
            borderRadius: 10.0,
            titleText: Text(
              "Favorites",
              style: GoogleFonts.mulish(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 236, 233, 233),
              ),
            ),
            icon: const Icon(LineIcons.heartAlt),
            messageText: Text(
              "$ownername was added succesfully to your favorites",
              style: const TextStyle(
                color: Color.fromARGB(255, 236, 233, 233),
              ),
            ),
            backgroundColor: const Color.fromARGB(214, 239, 74, 129),
          )
        : Get.rawSnackbar(
            borderRadius: 10.0,
            titleText: Text(
              "Favorites",
              style: GoogleFonts.mulish(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 236, 233, 233),
              ),
            ),
            messageText: Text(
              "$ownername was removed succesfully to your favorites",
              style: const TextStyle(
                color: Color.fromARGB(255, 236, 233, 233),
              ),
            ),
            icon: const Icon(LineIcons.heartBroken),
            backgroundColor: const Color.fromARGB(214, 239, 74, 129));
    update();
  }

  List courses = [
    {
      "title": "Course Math",
      "category": "Math",
      "video": YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=lGfsp2CWjok"),
      "description":
          "Learning about functions is critical in math, especially in Algebra.  Many students struggle with the concept of what a function is and how to determine is a relation is a function. ",
      "image": "assets/images/math.png",
      "vote": "4.5",
      "duree": "60 min",
      "owner": "Asma Essouied",
      "ownerimage":
          "https://img.freepik.com/free-photo/smiley-businesswoman-posing-outdoors-with-arms-crossed-copy-space_23-2148767055.jpg",
    },
    {
      "title": "Course Physics",
      "category": "Physics",
      "video": YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=lGfsp2CWjok"),
      "description":
          "This physics course explores fundamental concepts such as mechanics, thermodynamics, and electromagnetism. ",
      "image": "assets/images/physics.png",
      "vote": "4.3",
      "duree": "40 min",
      "owner": "Asma Essouied",
      "ownerimage":
          "https://img.freepik.com/free-photo/smiley-businesswoman-posing-outdoors-with-arms-crossed-copy-space_23-2148767055.jpg",
    },
  ];

  @override
  Future<void> launchurlowner(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      Get.rawSnackbar(
          borderRadius: 10.0,
          titleText: Text(
            "Error",
            style: GoogleFonts.mulish(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 236, 233, 233),
            ),
          ),
          messageText: const Text(
            'Could not launch fb url',
            style: TextStyle(
              color: Color.fromARGB(255, 236, 233, 233),
            ),
          ),
          icon: const Icon(LineIcons.heartBroken),
          backgroundColor: const Color.fromARGB(214, 239, 74, 129));
    }
  }
}

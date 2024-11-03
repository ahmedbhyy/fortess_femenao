import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class ProjectOwnerDetailsController extends GetxController {
  launchurlowner(String url);
  updatefavorite(bool isfavoriteselected, String ownername);
}

class ProjectOwnerDetailsControllerImp extends ProjectOwnerDetailsController {
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

  List projects = [
    {
      "name": "WomanLife",
      "duree": "1 month",
      "owner": "Asma mhalti",
      "personsubmitted": "3",
      "ownerimage":
          "https://img.freepik.com/photos-gratuite/portrait-jeune-femme-affaires-tenant-lunettes-main-fond-gris_23-2148029483.jpg",
      "image":
          "https://www.syscreations.ca/blog/wp-content/uploads/2022/08/Flo-Period.png",
      "description":
          "elle a pour but de répondre aux principaux besoins d’assistance et de soutien des victimes et des témoins, confrontés à une situation de violence présente, passée ou potentielle. L'application App-Elles® permet d'alerter et de contacter rapidement ses proches, les secours, les associations et toutes les autres ressources d'aide disponibles sur son territoire.",
    },
    {
      "name": "PregnantWoman",
      "duree": "28 days",
      "owner": "Asma mhalti",
      "personsubmitted": "4",
      "ownerimage":
          "https://img.freepik.com/photos-gratuite/portrait-jeune-femme-affaires-tenant-lunettes-main-fond-gris_23-2148029483.jpg",
      "image":
          "https://cdn.sanity.io/images/ordgikwe/production/6065edf5a1c80e68997783eaa7e1a95a61ce4602-1000x750.jpg?w=1000&h=750&auto=format",
      "description":
          "elle a pour but de répondre aux principaux besoins d’assistance et de soutien des victimes et des témoins, confrontés à une situation de violence présente, passée ou potentielle. L'application App-Elles® permet d'alerter et de contacter rapidement ses proches, les secours, les associations et toutes les autres ressources d'aide disponibles sur son territoire.",
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
          messageText:const  Text(
            'Could not launch fb url',
            style:  TextStyle(
              color: Color.fromARGB(255, 236, 233, 233),
            ),
          ),
          icon: const Icon(LineIcons.heartBroken),
          backgroundColor: const Color.fromARGB(214, 239, 74, 129));
    }
  }
}

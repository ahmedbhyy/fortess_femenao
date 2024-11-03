import 'package:flutter/material.dart';

import 'package:get/get.dart';

abstract class ProfilController extends GetxController {}

class ProfilControllerImp extends ProfilController {
  List names = [
    {
      "name": "Edit Profil",
      "icon": const Icon(
        Icons.person,
        color: Color.fromARGB(214, 239, 74, 129),
      )
    },
    {
      "name": "My Projects",
      "icon": const Icon(
        Icons.work_history_outlined,
        color: Color.fromARGB(214, 239, 74, 129),
      )
    },
    {
      "name": "About Us",
      "icon": const Icon(
        Icons.info,
        color: Color.fromARGB(214, 239, 74, 129),
      )
    },
    {
      "name": "Settings",
      "icon": const Icon(
        Icons.settings,
        color: Color.fromARGB(214, 239, 74, 129),
      )
    },
  ];
}

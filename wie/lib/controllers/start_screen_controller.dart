import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:wie/view/Home/home_screen.dart';
import 'package:wie/view/Home/homewidget/courses.dart';
import 'package:wie/view/Home/homewidget/profil_screen.dart';
import 'package:wie/view/Home/homewidget/success_story.dart';

abstract class StartController extends GetxController {
  void generatewindow(int i);
}

class StartControllerImp extends StartController {
  int selectedIndex = 0;
  String? userid;

  FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  List<Widget> listpage = [
    const HomeScreen(),
    const CoursesScreen(),
    const SuccesStories(),
    const ProfilScreen(),
  ];

  @override
  generatewindow(i) {
    selectedIndex = i;
    update();
  }
}

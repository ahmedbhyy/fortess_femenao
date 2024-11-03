import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:wie/controllers/start_screen_controller.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StartControllerImp());
    return GetBuilder<StartControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: const Color(0xfff7f6fa),
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(214, 239, 74, 129),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 30,
                color: Colors.black.withOpacity(.2),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 8),
              child: GNav(
                gap: 8,
                backgroundColor: const Color.fromARGB(214, 239, 74, 129),
                activeColor: const Color.fromARGB(214, 0, 0, 0),
                iconSize: 25,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: const Color.fromARGB(231, 255, 255, 255),
                color: const Color.fromARGB(195, 0, 0, 0),
                tabs: const [
                  GButton(
                    icon: LineIcons.home,
                    iconColor: Colors.white,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.book,
                    iconColor: Colors.white,
                    text: 'Courses',
                  ),
                  GButton(
                    icon: LineIcons.rocket,
                    iconColor: Colors.white,
                    text: 'Stories',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    iconColor: Colors.white,
                    text: 'Profil',
                  ),
                ],
                selectedIndex: controller.selectedIndex,
                onTabChange: (index) {
                  controller.generatewindow(index);
                },
              ),
            ),
          ),
        ),
        body: controller.listpage.elementAt(controller.selectedIndex),
      ),
    );
  }
}

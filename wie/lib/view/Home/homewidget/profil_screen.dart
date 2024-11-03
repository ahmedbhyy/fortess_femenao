import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:wie/controllers/Homecontrollers/profil_controller.dart';
import 'package:wie/view/commonwidgets/common_welcome_member.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfilControllerImp());
    return GetBuilder<ProfilControllerImp>(
      builder: (controller) => SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonWelcomeMember(
                membername: "Asma",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Profil",
                  style: GoogleFonts.mulish(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(200, 0, 0, 0),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CircleAvatar(
                  radius: 80,
                  child: Image.asset(
                    "assets/images/user3.png",
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ...List.generate(
                controller.names.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 60,
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.names[index]["name"],
                          style: GoogleFonts.mulish(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(134, 0, 0, 0),
                          ),
                        ),
                        controller.names[index]["icon"],
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Sign Out",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

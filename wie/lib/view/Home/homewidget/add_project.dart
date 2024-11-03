import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:line_icons/line_icons.dart';
import 'package:wie/controllers/Homecontrollers/add_project_controller.dart';
import 'package:wie/view/auth/authwidgets/button_auth.dart';
import 'package:wie/view/auth/authwidgets/textfieldauth.dart';

import 'package:wie/view/commonwidgets/common_appbar.dart';

class AddProjectScreen extends StatelessWidget {
  const AddProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddProjectControllerImp());
    return GetBuilder<AddProjectControllerImp>(
      builder: (controller) => Form(
        key: controller.formStateaddproject,
        child: Scaffold(
          backgroundColor: const Color(0xfff7f6fa),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: CommonAppBar(
              title: "Add Project",
              onPressed: () {
                Get.back();
              },
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.pink,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: controller.imageFile != null
                            ? FileImage(controller.imageFile!)
                            : NetworkImage(
                                controller.imageUrl,
                              ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -25,
                    right: 1,
                    child: IconButton(
                      onPressed: () async {
                        await controller.pickImage();
                      },
                      iconSize: 30,
                      icon: const Icon(
                        LineIcons.image,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Title",
                style: GoogleFonts.mulish(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(200, 0, 0, 0),
                ),
              ),
              TextFieldAuth(
                hint: "Title",
                readonly: false,
                mytype: TextInputType.text,
                mycontroller: controller.title!,
                myicon: const Icon(
                  Icons.title,
                  color: Color.fromARGB(214, 239, 74, 129),
                ),
                ispass: false,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Can't to be empty ";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Description",
                style: GoogleFonts.mulish(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(200, 0, 0, 0),
                ),
              ),
              TextFieldAuth(
                hint: "Description",
                readonly: false,
                mytype: TextInputType.text,
                mycontroller: controller.description!,
                myicon: const Icon(
                  Icons.description,
                  color: Color.fromARGB(214, 239, 74, 129),
                ),
                ispass: false,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Can't to be empty ";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Number of people",
                style: GoogleFonts.mulish(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(200, 0, 0, 0),
                ),
              ),
              TextFieldAuth(
                hint: "Number of people",
                readonly: false,
                mytype: TextInputType.text,
                mycontroller: controller.numberofpeople!,
                myicon: const Icon(
                  Icons.person,
                  color: Color.fromARGB(214, 239, 74, 129),
                ),
                ispass: false,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Can't to be empty ";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Duration",
                style: GoogleFonts.mulish(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(200, 0, 0, 0),
                ),
              ),
              TextFieldAuth(
                hint: "Duration",
                readonly: false,
                mytype: TextInputType.text,
                mycontroller: controller.duree!,
                myicon: const Icon(
                  Icons.timer,
                  color: Color.fromARGB(214, 239, 74, 129),
                ),
                ispass: false,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Can't to be empty ";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonAuth(
                mytitle: "Send",
                myfunction: () {
                  Get.back();
                  Get.rawSnackbar(
                    borderRadius: 10.0,
                    titleText: Text(
                      "Projects",
                      style: GoogleFonts.mulish(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 236, 233, 233),
                      ),
                    ),
                    icon: const Icon(LineIcons.heartAlt),
                    messageText: const Text(
                      "We have add your Project",
                      style: TextStyle(
                        color: Color.fromARGB(255, 236, 233, 233),
                      ),
                    ),
                    backgroundColor: const Color.fromARGB(214, 239, 74, 129),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

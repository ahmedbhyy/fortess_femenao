import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import 'package:wie/controllers/Homecontrollers/project_owner_controller.dart';
import 'package:wie/view/Home/project_details.dart';
import 'package:wie/view/commonwidgets/cachedimage_widget.dart';
import 'package:wie/view/slides/slide_right.dart';

class ProjectOwnerDetails extends StatelessWidget {
  final String ownerimage;
  final String ownername;
  const ProjectOwnerDetails(
      {super.key, required this.ownerimage, required this.ownername});

  @override
  Widget build(BuildContext context) {
    Get.put(ProjectOwnerDetailsControllerImp());
    return GetBuilder<ProjectOwnerDetailsControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: const Color(0xfff7f6fa),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    ),
                    child: CachedImageWidget(
                      borderradius: 0.0,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 3.5,
                      image: ownerimage,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 20,
                    child: Container(
                      height: 35.0,
                      width: 35.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: const Color.fromARGB(73, 233, 229, 229),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                        ),
                        color: const Color.fromARGB(249, 239, 74, 129),
                        iconSize: 20.0,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -25,
                    left: MediaQuery.of(context).size.width / 2 - 30,
                    child: FloatingActionButton(
                      backgroundColor: const Color.fromARGB(214, 239, 74, 129),
                      heroTag: null,
                      onPressed: () {
                        controller.launchurlowner("tel:+21653862002");
                      },
                      child: const Icon(
                        LineIcons.phone,
                        color: Color.fromARGB(222, 255, 255, 255),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -25,
                    left: MediaQuery.of(context).size.width / 2 - 100,
                    child: FloatingActionButton.small(
                      backgroundColor: const Color.fromARGB(226, 255, 255, 255),
                      heroTag: null,
                      onPressed: () {
                        controller.updatefavorite(
                            !controller.isfavorite, ownername);
                      },
                      child: controller.isfavorite
                          ? const Icon(
                              LineIcons.heartAlt,
                              color: Color.fromARGB(214, 239, 74, 129),
                            )
                          : const Icon(
                              LineIcons.heart,
                              color: Color.fromARGB(214, 239, 74, 129),
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: -25,
                    right: MediaQuery.of(context).size.width / 2 - 100,
                    child: FloatingActionButton.small(
                      backgroundColor: const Color.fromARGB(226, 255, 255, 255),
                      onPressed: () {
                        controller.launchurlowner(
                            "https://www.facebook.com/ahmed.belhajyahia/");
                      },
                      heroTag: null,
                      child: const Icon(
                        LineIcons.facebook,
                        color: Color.fromARGB(214, 239, 74, 129),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 45.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Text(
                      "PROFESSIONAL",
                      style: GoogleFonts.mulish(
                        fontSize: 11.0,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Text(
                      "Verified",
                      style: GoogleFonts.mulish(
                        fontSize: 11.0,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ownername,
                    style: GoogleFonts.mulish(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 7.0,
                  ),
                  const Icon(
                    Icons.verified_rounded,
                    color: Color.fromARGB(214, 239, 74, 129),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: 320.0,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color.fromARGB(128, 226, 223, 223),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "12",
                          style: GoogleFonts.mulish(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        const Text("Rank"),
                      ],
                    ),
                    Container(
                      height: 45.0,
                      width: 0.8,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(140, 0, 0, 0)),
                    ),
                    Column(
                      children: [
                        Text(
                          "88",
                          style: GoogleFonts.mulish(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        const Text("Followers"),
                      ],
                    ),
                    Container(
                      height: 45.0,
                      width: 0.8,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(140, 0, 0, 0),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "4",
                          style: GoogleFonts.mulish(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        const Text("Projects"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 13.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Others Projects",
                      style: GoogleFonts.mulish(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const Icon(
                      LineIcons.react,
                      color: Color.fromARGB(214, 239, 74, 129),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      controller.projects.length,
                      (index) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            SlideRight(
                              page: ProjectDetails(
                                duree: controller.projects[index]["duree"],
                                image: controller.projects[index]["image"],
                                ownerimage: controller.projects[index]
                                    ["ownerimage"],
                                projectowner: controller.projects[index]
                                    ["owner"],
                                personsubmitted: controller.projects[index]
                                    ["personsubmitted"],
                                title: controller.projects[index]["name"],
                                description: controller.projects[index]
                                    ["description"],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 280,
                          width: 200,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedImageWidget(
                                image: controller.projects[index]["image"],
                                borderradius: 15,
                                height: 110,
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                controller.projects[index]["name"],
                                style: GoogleFonts.mulish(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(200, 0, 0, 0),
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                controller.projects[index]["description"],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                                style: GoogleFonts.mulish(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(134, 0, 0, 0),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          52, 158, 158, 158),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          LineIcons.user,
                                          color: Color.fromARGB(
                                            200,
                                            233,
                                            30,
                                            98,
                                          ),
                                        ),
                                        Text(
                                          controller.projects[index]
                                              ["personsubmitted"],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    LineIcons.arrowCircleRight,
                                    size: 18,
                                    color: Color.fromARGB(214, 239, 74, 129),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
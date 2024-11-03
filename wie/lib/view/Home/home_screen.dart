import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:wie/controllers/Homecontrollers/home_controller.dart';
import 'package:wie/view/Home/allprojects.dart';
// import 'package:wie/view/Home/homewidget/chat.dart';
import 'package:wie/view/Home/homewidget/gemini_chat.dart';
import 'package:wie/view/Home/project_details.dart';
import 'package:wie/view/commonwidgets/cachedimage_widget.dart';
import 'package:wie/view/commonwidgets/common_welcome_member.dart';
import 'package:wie/view/slides/slide_right.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => SafeArea(
        child: Column(
          children: [
            const CommonWelcomeMember(
              membername: "Asma",
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  return;
                },
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(214, 239, 74, 129),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width / 4,
                          bottom: 4,
                          child: Image.asset(
                            "assets/images/education.png",
                          ),
                        ),
                        Positioned(
                          left: 5,
                          top: 27,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Let's Learn",
                                style: GoogleFonts.vollkorn(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(213, 251, 251, 251),
                                ),
                              ),
                              Text(
                                "More!",
                                style: GoogleFonts.vollkorn(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(213, 251, 251, 251),
                                ),
                              ),
                              TextButton.icon(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    SlideRight(
                                      page: const ChatGemini(
                                        image:
                                            "https://img.freepik.com/premium-vector/young-happy-man-with-thumbs-up-vector-flat-style-cartoon-illustration_357257-1138.jpg",
                                      ),
                                    ),
                                  );
                                },
                                iconAlignment: IconAlignment.end,
                                label: Text(
                                  "Start With Our AI",
                                  style: GoogleFonts.mulish(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                        213, 251, 251, 251),
                                  ),
                                ),
                                icon: const Icon(
                                  LineIcons.arrowCircleRight,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: -20,
                          right: MediaQuery.of(context).size.width / 9,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                            width: 300,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: "search",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor:
                                        const Color.fromARGB(172, 0, 0, 0),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(LineIcons.search),
                                      iconSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                prefixIconColor:
                                    const Color.fromARGB(214, 239, 74, 129),
                                labelStyle: const TextStyle(
                                  color: Color.fromARGB(255, 1, 81, 70),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(208, 239, 55, 117),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Categories",
                      style: GoogleFonts.mulish(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(200, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            controller.categories.length,
                            (index) => Container(
                              height: 150,
                              width: 150,
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    controller.categories[index]["image"],
                                    height: 90,
                                  ),
                                  Text(
                                    controller.categories[index]["name"],
                                    style: GoogleFonts.mulish(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(200, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Projects",
                          style: GoogleFonts.mulish(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(200, 0, 0, 0),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              SlideRight(
                                page: const Allprojects(),
                              ),
                            );
                          },
                          child: Text(
                            "See all",
                            style: GoogleFonts.mulish(
                              fontSize: 15.0,
                              color: const Color.fromARGB(200, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
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
                                      duree: controller.projects[index]
                                          ["duree"],
                                      image: controller.projects[index]
                                          ["image"],
                                      ownerimage: controller.projects[index]
                                          ["ownerimage"],
                                      projectowner: controller.projects[index]
                                          ["owner"],
                                      personsubmitted: controller
                                          .projects[index]["personsubmitted"],
                                      title: controller.projects[index]["name"],
                                      description: controller.projects[index]
                                          ["description"],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 300,
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
                                    Hero(
                                      tag: controller.projects[index]["image"],
                                      child: CachedImageWidget(
                                        image: controller.projects[index]
                                            ["image"],
                                        borderradius: 15,
                                        height: 110,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      controller.projects[index]["name"],
                                      style: GoogleFonts.mulish(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            const Color.fromARGB(200, 0, 0, 0),
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
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            const Color.fromARGB(134, 0, 0, 0),
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
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                          color:
                                              Color.fromARGB(214, 239, 74, 129),
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
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import 'package:wie/controllers/Homecontrollers/course_details_controller.dart';
import 'package:wie/view/Home/homewidget/course_owner.dart';
import 'package:wie/view/Home/homewidget/exercice.dart';
import 'package:wie/view/Home/homewidget/projectcontainer.dart';
import 'package:wie/view/commonwidgets/cachedimage_widget.dart';

import 'package:wie/view/commonwidgets/common_appbar.dart';
import 'package:wie/view/slides/slide_right.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseDetail extends StatelessWidget {
  final String title;
  final String video;
  final String image;
  final String duree;
  final String courseowner;
  final String ownerimage;
  final String description;
  final String vote;
  const CourseDetail(
      {super.key,
      required this.title,
      required this.image,
      required this.duree,
      required this.ownerimage,
      required this.courseowner,
      required this.description,
      required this.vote,
      required this.video});

  @override
  Widget build(BuildContext context) {
    Get.put(CourseDetailsControllerImp(video));

    return GetBuilder<CourseDetailsControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: const Color(0xfff7f6fa),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CommonAppBar(
            title: title,
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: YoutubePlayer(
                    controller: controller.youtubecontroller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.pink,
                    progressColors: const ProgressBarColors(
                      playedColor: Colors.pink,
                      handleColor: Colors.pink,
                    ),
                  ),
                ),
                Obx(() {
                  if (!controller.isPlaying.value) {
                    return Positioned(
                      bottom: -25.0,
                      right: MediaQuery.of(context).size.width / 12,
                      child: Container(
                        height: 60.0,
                        width: 300.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: const Color.fromARGB(154, 25, 29, 26),
                          border: Border.all(
                            color: const Color.fromARGB(214, 239, 74, 129),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ProjectContainer(
                                text1: "Time",
                                text2: duree,
                                myicon: const Icon(
                                  LineIcons.clock,
                                  color: Color.fromARGB(255, 241, 245, 242),
                                ),
                              ),
                              Container(
                                height: 35.0,
                                width: 0.8,
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                              ),
                              ProjectContainer(
                                text1: "Vote",
                                myicon: const Icon(
                                  LineIcons.star,
                                  color: Color.fromARGB(255, 241, 245, 242),
                                ),
                                text2: vote,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return Container();
                }),
              ],
            ),
            const SizedBox(height: 40.0),
            Text(
              "Description",
              textAlign: TextAlign.start,
              style: GoogleFonts.mulish(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(200, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
              description,
              textAlign: TextAlign.start,
              style: GoogleFonts.mulish(
                fontSize: 16.0,
                color: const Color.fromARGB(255, 131, 130, 130),
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
              "Created By",
              textAlign: TextAlign.start,
              style: GoogleFonts.mulish(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(200, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 10.0),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  SlideRight(
                    page: CourseOwner(
                      ownerimage: ownerimage,
                      ownername: courseowner,
                    ),
                  ),
                );
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        "Student",
                        style: GoogleFonts.mulish(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      subtitle: Text(
                        courseowner,
                        style: GoogleFonts.mulish(
                          fontSize: 13,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      trailing: const Icon(
                        LineIcons.starAlt,
                        color: Color.fromARGB(214, 239, 74, 129),
                        size: 19.0,
                      ),
                      leading: CachedImageWidget(
                        borderradius: 10.0,
                        width: 100.0,
                        height: 100.0,
                        image: ownerimage,
                      ),
                    ),
                  ),
                  const Positioned(
                    right: 5,
                    child: Icon(
                      LineIcons.heart,
                      color: Color.fromARGB(214, 239, 74, 129),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
              "Exercices",
              textAlign: TextAlign.start,
              style: GoogleFonts.mulish(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(200, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 15.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    controller.exercices.length,
                    (index) => InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          SlideRight(
                            page:  ExerciceScreen(title:   controller.exercices[index]["title"]),
                          ),
                        );
                      },
                      child: Container(
                        height: 200,
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
                            Image.asset(
                              "assets/images/math.png",
                              height: 60,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              controller.exercices[index]["title"],
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
                              controller.exercices[index]["description"],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              style: GoogleFonts.mulish(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(134, 0, 0, 0),
                              ),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        const Color.fromARGB(52, 158, 158, 158),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        controller.exercices[index]
                                            ["difficulty"],
                                      ),
                                      const Icon(
                                        LineIcons.fire,
                                        color: Color.fromARGB(
                                          200,
                                          233,
                                          30,
                                          98,
                                        ),
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
    );
  }
}

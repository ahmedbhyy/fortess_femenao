import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:wie/controllers/Homecontrollers/courses_screen_controller.dart';
import 'package:wie/view/Home/homewidget/course_detail.dart';
import 'package:wie/view/commonwidgets/common_welcome_member.dart';
import 'package:wie/view/slides/slide_right.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(CoursesScreenControllerImp());
    return GetBuilder<CoursesScreenControllerImp>(
      builder: (controller) => SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CommonWelcomeMember(
              membername: "Asma",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Categories",
                style: GoogleFonts.mulish(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(200, 0, 0, 0),
                ),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  return;
                },
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        height: 50.0,
                        child: ListView.builder(
                          itemCount: controller.categories.length,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              controller.updateColor(index);
                              controller.categoryname =
                                  controller.categories[index];
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              width: 100.0,
                              margin: const EdgeInsets.all(6.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xff00aa86), width: 2.0),
                                borderRadius: BorderRadius.circular(20.0),
                                color: controller.isSelectedList[index]
                                    ? const Color.fromARGB(214, 239, 74, 129)
                                    : Colors.transparent,
                              ),
                              child: Text(
                                controller.categories[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: controller.isSelectedList[index]
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 3.0,
                        childAspectRatio: 0.54,
                        crossAxisSpacing: 2.0,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          controller.updateList(controller.categoryname).length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            SlideRight(
                              page: CourseDetail(
                                courseowner: controller.updateList(
                                    controller.categoryname)[index]["owner"],
                                    video: controller.updateList(
                                    controller.categoryname)[index]["video"],
                                description: controller.updateList(
                                        controller.categoryname)[index]
                                    ["description"],
                                duree: controller.updateList(
                                    controller.categoryname)[index]["duree"],
                                image: controller.updateList(
                                    controller.categoryname)[index]["image"],
                                ownerimage: controller.updateList(
                                        controller.categoryname)[index]
                                    ["ownerimage"],
                                title: controller.updateList(
                                    controller.categoryname)[index]["title"],
                                vote: controller.updateList(
                                    controller.categoryname)[index]["vote"],
                              ),
                            ),
                          );
                        },
                        child: Container(
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
                                height: 150,
                                controller.updateList(
                                    controller.categoryname)[index]["image"],
                              ),
                              Text(
                                controller.updateList(
                                    controller.categoryname)[index]["title"],
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
                                controller.updateList(
                                        controller.categoryname)[index]
                                    ["description"],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                                style: GoogleFonts.mulish(
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(134, 0, 0, 0),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Time :${controller.updateList(controller.categoryname)[index]["duree"]}",
                                style: GoogleFonts.mulish(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(133, 228, 5, 5),
                                ),
                              ),
                              const Spacer(),
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
                                          LineIcons.star,
                                          color: Color.fromARGB(
                                            200,
                                            233,
                                            30,
                                            98,
                                          ),
                                          size: 15,
                                        ),
                                        Text(
                                          controller.updateList(controller
                                              .categoryname)[index]["vote"],
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    )
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

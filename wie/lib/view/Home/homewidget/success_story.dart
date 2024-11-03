import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:wie/controllers/Homecontrollers/success_story_controller.dart';
import 'package:wie/view/Home/homewidget/storie_details.dart';
import 'package:wie/view/commonwidgets/cachedimage_widget.dart';
import 'package:wie/view/commonwidgets/common_welcome_member.dart';
import 'package:wie/view/slides/slide_right.dart';

class SuccesStories extends StatelessWidget {
  const SuccesStories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SuccessStoriesControllerImp());
    return GetBuilder<SuccessStoriesControllerImp>(
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
                "Success Stories",
                style: GoogleFonts.mulish(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(200, 0, 0, 0),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ...List.generate(
                    controller.stories.length,
                    (index) => InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          SlideRight(
                            page: StoryDetails(
                              date: controller.stories[index]["date"],
                              description: controller.stories[index]
                                  ["description"],
                              image: controller.stories[index]["image"],
                              owner: controller.stories[index]["owner"],
                              title: controller.stories[index]["title"],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                              tag: controller.stories[index]["image"],
                              child: CachedImageWidget(
                                image: controller.stories[index]["image"],
                                borderradius: 15,
                                height: 300,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              controller.stories[index]["title"],
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
                              controller.stories[index]["description"],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              style: GoogleFonts.mulish(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(134, 0, 0, 0),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
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
                                        controller.stories[index]["date"],
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  LineIcons.arrowCircleRight,
                                  size: 25,
                                  color: Color.fromARGB(214, 239, 74, 129),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

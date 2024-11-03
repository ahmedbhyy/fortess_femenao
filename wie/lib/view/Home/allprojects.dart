import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:wie/controllers/Homecontrollers/allproject_controller.dart';
import 'package:wie/view/Home/homewidget/add_project.dart';
import 'package:wie/view/Home/project_details.dart';
import 'package:wie/view/commonwidgets/cachedimage_widget.dart';
import 'package:wie/view/commonwidgets/common_appbar.dart';
import 'package:wie/view/slides/slide_right.dart';

class Allprojects extends StatelessWidget {
  const Allprojects({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllProjectControllerImp());
    return GetBuilder<AllProjectControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: const Color(0xfff7f6fa),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color.fromARGB(214, 239, 74, 129),
          onPressed: () {
            Navigator.of(context).push(
              SlideRight(
                page: const AddProjectScreen(),
              ),
            );
          },
          extendedPadding: const EdgeInsets.all(100.0),
          label: Text(
            "Add Project",
            style: GoogleFonts.mulish(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(199, 255, 255, 255),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CommonAppBar(
            title: "All Projects",
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            Text(
              "New",
              style: GoogleFonts.mulish(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(200, 0, 0, 0),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 3.0,
                childAspectRatio: 0.6,
                crossAxisSpacing: 2.0,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.newprojects.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    SlideRight(
                      page: ProjectDetails(
                        duree: controller.newprojects[index]["duree"],
                        image: controller.newprojects[index]["image"],
                        ownerimage: controller.newprojects[index]["ownerimage"],
                        projectowner: controller.newprojects[index]["owner"],
                        personsubmitted: controller.newprojects[index]
                            ["personsubmitted"],
                        title: controller.newprojects[index]["name"],
                        description: controller.newprojects[index]
                            ["description"],
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
                      CachedImageWidget(
                        image: controller.newprojects[index]["image"],
                        borderradius: 15,
                        height: 110,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        controller.newprojects[index]["name"],
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
                        controller.newprojects[index]["description"],
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
                              color: const Color.fromARGB(52, 158, 158, 158),
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
                                  controller.newprojects[index]
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "All",
              style: GoogleFonts.mulish(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(200, 0, 0, 0),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 3.0,
                childAspectRatio: 0.55,
                crossAxisSpacing: 2.0,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.oldprojects.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    SlideRight(
                      page: ProjectDetails(
                        duree: controller.oldprojects[index]["duree"],
                        image: controller.oldprojects[index]["image"],
                        ownerimage: controller.oldprojects[index]["ownerimage"],
                        projectowner: controller.oldprojects[index]["owner"],
                        personsubmitted: controller.oldprojects[index]
                            ["personsubmitted"],
                        title: controller.oldprojects[index]["name"],
                        description: controller.oldprojects[index]
                            ["description"],
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
                      CachedImageWidget(
                        image: controller.oldprojects[index]["image"],
                        borderradius: 15,
                        height: 110,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        controller.oldprojects[index]["name"],
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
                        controller.oldprojects[index]["description"],
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
                              color: const Color.fromARGB(52, 158, 158, 158),
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
                                  controller.oldprojects[index]
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}

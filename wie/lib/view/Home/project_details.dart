import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:wie/controllers/Homecontrollers/project_details_controller.dart';
import 'package:wie/view/Home/homewidget/projectcontainer.dart';
import 'package:wie/view/Home/homewidget/projectowner_details.dart';
import 'package:wie/view/commonwidgets/cachedimage_widget.dart';
import 'package:wie/view/commonwidgets/common_appbar.dart';
import 'package:wie/view/slides/slide_right.dart';

class ProjectDetails extends StatelessWidget {
  final String title;
  final String image;
  final String duree;
  final String ownerimage;
  final String projectowner;
  final String description;
  final String personsubmitted;
  const ProjectDetails(
      {super.key,
      required this.title,
      required this.image,
      required this.personsubmitted,
      required this.description,
      required this.projectowner,
      required this.ownerimage,
      required this.duree});

  @override
  Widget build(BuildContext context) {
    Get.put(ProjectDetailsControllerImp());
    return GetBuilder<ProjectDetailsControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: const Color(0xfff7f6fa),
        floatingActionButton: controller.isreseved
            ? Container()
            : FloatingActionButton.extended(
                backgroundColor: const Color.fromARGB(214, 239, 74, 129),
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.question,
                    animType: AnimType.rightSlide,
                    title: "Participate",
                    desc: 'Would you like to participate in this project?',
                    btnCancelOnPress: () {},
                    btnOkText: "Yes",
                    btnOkColor: const Color.fromARGB(214, 239, 74, 129),
                    btnOkOnPress: () {
                      controller.updatereservation();
                      Get.rawSnackbar(
                        borderRadius: 10.0,
                        titleText: Text(
                          "Participation",
                          style: GoogleFonts.mulish(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 236, 233, 233),
                          ),
                        ),
                        messageText: const Text(
                          'We have sent  your invitation to the project owner, please wait for her response.',
                          style: TextStyle(
                            color: Color.fromARGB(255, 236, 233, 233),
                          ),
                        ),
                        icon: const Icon(LineIcons.infoCircle),
                        backgroundColor:
                            const Color.fromARGB(214, 239, 74, 129),
                      );
                    },
                  ).show();
                },
                extendedPadding: const EdgeInsets.all(100.0),
                label: Text(
                  "Participate",
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
                Hero(
                  tag: image,
                  child: CachedImageWidget(
                    borderradius: 12.0,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 2.2,
                    image: image,
                  ),
                ),
                Positioned(
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
                          const ProjectContainer(
                            text1: "Duration",
                            text2: "1 month",
                            myicon: Icon(
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
                            text1: "Person",
                            myicon: const Icon(
                              LineIcons.user,
                              color: Color.fromARGB(255, 241, 245, 242),
                            ),
                            text2: personsubmitted,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            Text(
              title,
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
              "Posted By",
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
                    page: ProjectOwnerDetails(
                      ownerimage: ownerimage,
                      ownername: projectowner,
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
                        projectowner,
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
          ],
        ),
      ),
    );
  }
}

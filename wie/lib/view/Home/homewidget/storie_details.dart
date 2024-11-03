import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wie/view/commonwidgets/cachedimage_widget.dart';
import 'package:wie/view/commonwidgets/common_appbar.dart';

class StoryDetails extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String image;
  final String owner;
  const StoryDetails(
      {super.key,
      required this.title,
      required this.description,
      required this.date,
      required this.image,
      required this.owner});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Hero(
            tag: image,
            child: CachedImageWidget(
              image: image,
              borderradius: 15,
              height: 300,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            owner,
            style: GoogleFonts.mulish(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(200, 0, 0, 0),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Description",
            style: GoogleFonts.mulish(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(200, 0, 0, 0),
            ),
          ),
          Text(
            description,
            style: GoogleFonts.mulish(
              fontSize: 18.0,
              color: const Color.fromARGB(200, 0, 0, 0),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Date",
            style: GoogleFonts.mulish(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(200, 0, 0, 0),
            ),
          ),
          Text(
            date,
            style: GoogleFonts.mulish(
              fontSize: 18.0,
              color: const Color.fromARGB(200, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }
}

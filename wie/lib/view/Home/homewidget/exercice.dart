import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wie/view/Home/homewidget/chat.dart';
import 'package:wie/view/commonwidgets/common_appbar.dart';
import 'package:wie/view/slides/slide_right.dart';

class ExerciceScreen extends StatelessWidget {
  final String title;
  const ExerciceScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f6fa),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
           Navigator.of(context).push(
            SlideRight(
              page:const  ChatScreen(),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(214, 239, 74, 129),
        label:const  Text(
          "Chat",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
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
        children: [],
      ),
    );
  }
}

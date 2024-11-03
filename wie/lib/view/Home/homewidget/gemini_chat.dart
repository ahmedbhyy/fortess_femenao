import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wie/view/Home/homewidget/sections/chat_stream.dart';
import 'package:wie/view/Home/homewidget/sections/stream.dart';

class SectionItem {
  final int index;
  final String title;
  final Icon myicon;
  final Widget widget;

  SectionItem(this.index, this.title, this.widget, this.myicon);
}

class ChatGemini extends StatefulWidget {
  final String image;
  const ChatGemini({super.key, required this.image});

  @override
  State<ChatGemini> createState() => _ChatGeminiState();
}

class _ChatGeminiState extends State<ChatGemini> {
  int _selectedItem = 0;
  late List<SectionItem> _sections;

  @override
  void initState() {
    super.initState();
    _initializeSections();
  }

  void _initializeSections() {
    _sections = [
      SectionItem(0, 'Stream text', const SectionTextStreamInput(),
          const Icon(Icons.text_fields_sharp)),
      SectionItem(1, 'Stream chat', SectionStreamChat(image: widget.image),
          const Icon(Icons.chat_outlined)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          "Our AI",
          style: GoogleFonts.mulish(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(199, 255, 255, 255),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        actions: [
          PopupMenuButton<int>(
            initialValue: _selectedItem,
            onSelected: (value) => setState(() => _selectedItem = value),
            itemBuilder: (context) => _sections.map((e) {
              return PopupMenuItem<int>(
                  value: e.index,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      e.myicon,
                      Text(e.title),
                    ],
                  ));
            }).toList(),
            child: const Icon(Icons.more_vert_rounded),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.asset(
              "assets/images/applogo.png",
              height: 50.0,
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedItem,
        children: _sections.map((e) => e.widget).toList(),
      ),
    );
  }
}

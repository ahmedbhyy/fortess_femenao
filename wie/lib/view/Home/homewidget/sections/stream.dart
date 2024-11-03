import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:wie/view/Home/homewidget/gemini_widget/chat_input_box.dart';
import 'package:wie/view/Home/homewidget/gemini_widget/item_image.dart';

class SectionTextStreamInput extends StatefulWidget {
  const SectionTextStreamInput({super.key});

  @override
  State<SectionTextStreamInput> createState() => _SectionTextInputStreamState();
}

class _SectionTextInputStreamState extends State<SectionTextStreamInput> {
  final ImagePicker picker = ImagePicker();
  final controller = TextEditingController();
  final gemini = Gemini.instance;
  String? searchedText, _finishReason;

  List<Uint8List>? images;

  String? get finishReason => _finishReason;

  set finishReason(String? set) {
    if (set != _finishReason) {
      setState(() => _finishReason = set);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (searchedText != null)
          MaterialButton(
              color: const Color.fromARGB(175, 233, 30, 98),
              onPressed: () {
                setState(() {
                  searchedText = null;
                  finishReason = null;
                  // result = null;
                });
              },
              child: Text(
                'search: $searchedText',
                style: TextStyle(color: Colors.white),
              )),
        Expanded(child: GeminiResponseTypeView(
          builder: (context, child, response, loading) {
            if (loading) {
              return Lottie.asset('assets/lotties/lottie_loading2.json');
            }

            if (response != null) {
              return Markdown(
                data: response,
                selectable: true,
              );
            } else {
              return const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Search something!'), Icon(Icons.search)],
                ),
              );
            }
          },
        )),
        if (finishReason != null) Text(finishReason!),
        if (images != null)
          Container(
            height: 120,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            alignment: Alignment.centerLeft,
            child: Card(
              child: ListView.builder(
                itemBuilder: (context, index) => ItemImageView(
                  bytes: images!.elementAt(index),
                ),
                itemCount: images!.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ChatInputBox(
          controller: controller,
          onClickCamera: () {
            picker.pickMultiImage().then((value) async {
              final imagesBytes = <Uint8List>[];
              for (final file in value) {
                imagesBytes.add(await file.readAsBytes());
              }

              if (imagesBytes.isNotEmpty) {
                setState(() {
                  images = imagesBytes;
                });
              }
            });
          },
          onSend: () {
            if (controller.text.isNotEmpty) {
              searchedText = controller.text;
              controller.clear();
              gemini
                  .streamGenerateContent(searchedText!, images: images)
                  .handleError((e) {
                if (e is GeminiException) {
                  Get.rawSnackbar(
                      title: "Error",
                      message: "Please try again!",
                      backgroundColor: Colors.red);
                }
              }).listen((value) {
                setState(() {
                  images = null;
                });

                if (value.finishReason != 'STOP') {
                  finishReason = 'Finish reason is `${value.finishReason}`';
                }
              });
            }
          },
        )
      ],
    );
  }
}

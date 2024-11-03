import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class AddProjectController extends GetxController {
  pickImage();
}

class AddProjectControllerImp extends AddProjectController {


  TextEditingController? title;
  TextEditingController? description;
  TextEditingController? numberofpeople;
  TextEditingController? duree;
   GlobalKey<FormState> formStateaddproject = GlobalKey<FormState>();
  @override
  void onInit() {
   title=TextEditingController();
   description=TextEditingController();
   numberofpeople=TextEditingController();
    duree = TextEditingController();
    super.onInit();
  }


  // ignore: prefer_typing_uninitialized_variables
  var imageFile;
  String imageUrl="https://cdn-icons-png.flaticon.com/512/8162/8162325.png";
  @override
  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    } else {
      return;
    }
    update();
  }
}

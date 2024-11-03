import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class CourseDetailsController extends GetxController {
  RxBool isPlaying = false.obs;
}

class CourseDetailsControllerImp extends CourseDetailsController {
  late YoutubePlayerController youtubecontroller;

  CourseDetailsControllerImp(String video) {
    youtubecontroller = YoutubePlayerController(
      initialVideoId:video ,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );

    youtubecontroller.addListener(() {
      isPlaying.value = youtubecontroller.value.isPlaying;
    });
  }

  List exercices = [
    {
      "title": "execice1",
      "description": "eaezazdaz",
      "difficulty": "6/10",
    },
    {
      "title": "execice2",
      "description": "eaezazdaz",
      "difficulty": "8/10",
    }
  ];

  @override
  void onClose() {
    youtubecontroller.dispose();
    super.onClose();
  }
}

import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class CoursesScreenController extends GetxController {
  void updateColor(int index);
  List updateList(String category);
}

class CoursesScreenControllerImp extends CoursesScreenController {
  List categories = [];
  List<bool> isSelectedList = [];

  String categoryname = "All";
  List courses = [
    {
      "title": "Maths Course" ,
      "category": "Maths",
      "video": YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=lGfsp2CWjok"),
      "description":
          "This math course provides comprehensive and progressive learning, covering essential concepts such as algebra, geometry, and statistics.",
      "image": "assets/images/math.png",
      "vote": "4.5",
      "duree": "60 min",
      "owner": "Asma Essouied",
      "ownerimage":
          "https://img.freepik.com/free-photo/smiley-businesswoman-posing-outdoors-with-arms-crossed-copy-space_23-2148767055.jpg",
    },
    {
      "title": "Physics Course",
      "category": "Physics",
      "video": YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=ZAqIoDhornk"),
      "description":
          "This physics course explores fundamental concepts such as mechanics, thermodynamics, and electromagnetism. ",
      "image": "assets/images/physics.png",
      "vote": "4.3",
      "duree": "40 min",
      "owner": "Asma Essouied",
      "ownerimage":
          "https://img.freepik.com/free-photo/smiley-businesswoman-posing-outdoors-with-arms-crossed-copy-space_23-2148767055.jpg",
    },
    {
      "title": "Science Course",
      "category": "Science",
      "video": YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=_1fqGEeyI00"),
      "description":
          "This science course offers a broad and integrated approach to key scientific principles, covering topics in biology, chemistry, and earth sciences",
      "image": "assets/images/science.png",
      "vote": "4.5",
      "duree": "50 min",
      "owner": "Nermine Sanna",
      "ownerimage":
          "https://img.freepik.com/free-photo/successful-female-entrepreneur-blue-collar-shirt_176420-28478.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1722643200&semt=ais_hybrid",
    },
    {
      "title": "Web dev",
      "category": "dev",
      "video": YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=bWACo_pvKxg&list=PLSDeUiTMfxW6VChKWb26Z_mPR4f6fAmMV"),
      "duree": "60 min",
      "description":
          "This web development course provides hands-on experience in building modern and responsive websites. ",
      "image": "assets/images/dev.png",
      "vote": "5.0",
      "owner": "Karima Chakroun",
      "ownerimage":
          "https://img.freepik.com/free-photo/successful-female-entrepreneur-blue-collar-shirt_176420-28478.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1722643200&semt=ais_hybrid",
    },
    {
      "title": "Art Course",
      "category": "Art",
      "video": YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=LAc4AjSXMX0&list=PLdIDMj3VSgBdqwE6B-ZDrGAQkesnjAe2e"),
      "duree": "60 min",
      "description":
          "This art course encourages creativity and self-expression through various mediums, including drawing, painting, and sculpture. ",
      "image": "assets/images/art.png",
      "vote": "3.6",
      "owner": "Fatma Derwich",
      "ownerimage":
          "https://img.freepik.com/photos-gratuite/portrait-jeune-femme-affaires-tenant-lunettes-main-fond-gris_23-2148029483.jpg",
    },
  ];

  CoursesScreenControllerImp() {
    categories = [
      "All",
      "Maths",
      "Physics",
      "Science",
      "Art",
    ];
    isSelectedList = List<bool>.filled(categories.length, false);
    isSelectedList[0] = true;
  }

  @override
  void updateColor(index) {
    isSelectedList = List<bool>.filled(categories.length, false);
    isSelectedList[index] = !isSelectedList[index];
    update();
  }

  @override
  List updateList(String category) {
    if (categoryname == "All") {
      return courses;
    } else {
      return courses.where((course) => course['category'] == category).toList();
    }
  }
}

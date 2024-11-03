import 'package:get/get.dart';

abstract class HomeController extends GetxController {}

class HomeControllerImp extends HomeController {
  List categories = [
    {
      "name": "Maths",
      "image": "assets/images/math.png",
    },
    {
      "name": "Art",
      "image": "assets/images/art.png",
    },
    {
      "name": "Science",
      "image": "assets/images/science.png",
    },
    {
      "name": "Physics",
      "image": "assets/images/physics.png",
    },
    {
      "name": "Dev",
      "image": "assets/images/dev.png",
    },
  ];

  List projects = [
    {
      "name": "App-Elles",
      "duree": "1 month",
      "owner": "Asma mhalti",
      "personsubmitted": "4",
      "ownerimage":
          "https://img.freepik.com/photos-gratuite/portrait-jeune-femme-affaires-tenant-lunettes-main-fond-gris_23-2148029483.jpg",
      "image":
          "https://dfm.mc/wp-content/uploads/2023/10/App-elles-newsletter.png",
      "description":
          "It aims to address the main assistance and support needs of victims and witnesses facing a situation of current, past, or potential violence. The App-Elles® application allows users to quickly alert and contact their loved ones, emergency services, associations, and all other available support resources in their area.",
    },
    {
      "name": "Peanut",
      "duree": "20 days",

      "personsubmitted": "5",
      "owner": "Nermine Ezzine",
      "ownerimage":
          "https://static.vecteezy.com/system/resources/thumbnails/038/974/578/small_2x/ai-generated-professional-portrait-of-a-competent-woman-free-photo.jpg",
      "image": "https://gagadget.com/media/post_big/peanut-2.webp",
      "description":
          "Peanut provides access to a community who are there to listen, share information and offer valuable advice.We envision a world where no woman has to navigate life alone. Where they have a safe space to find friendship and be vulnerable.",
    },
    {
      "name": "Women's Health",
      "duree": "25 days",

      "owner": "Houda Khedher",
      "ownerimage":
          "https://img.freepik.com/photos-gratuite/expressions-emotions-du-visage-humain-positive-joyeuse-jeune-belle-femme-aux-cheveux-raides-blonds-dans-vetements-decontractes_176420-15188.jpg?semt=ais_hybrid",
      "personsubmitted": "3",
      "description":
          " the Women's Health UK app is home to an ever-growing library of 120+ real-time workout videos hosted by our industry-leading expert panel, including the likes of strength coach Izy George, yogi and lululemon ambassador Sanchia Legister and menopause trainer Kate Rowe-Ham.",
      "image":
          "https://hips.hearstapps.com/hmg-prod/images/screen-shot-2021-12-01-at-14-09-25-1638367933.png",
    },
  ];
}

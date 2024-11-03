import 'package:get/get.dart';

abstract class SuccessStoriesController extends GetxController {}

class SuccessStoriesControllerImp extends SuccessStoriesController {
  List stories = [
    {
      "title": "Liberty Brought Us Here",
      "description":
          "she created a line of hair care products specifically designed for Black women, which revolutionized the beauty industry.Her products were not only effective, but they also empowered Black women to embrace their natural hair and take pride in their appearance. With a keen sense of marketing and business understanding, she built a vast network of sales agents who helped distribute her products to a wider audience.",
      "owner": "Susan Lindsey",
      "image":
          "https://womenwhowrite.com/site/uploads/2018/04/Success-Story-Susan.jpg",
      "date": "3 Nov 2024",
    },
    {
      "title": "Business Analyst Professional",
      "description":
          "Business/Systems/QA analyst position to capitalize on my unique combination of business/systems analysis and programming skills 10+ years of extensive experience in Information Technology including",
      "owner": "Irene Sulyevich",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd0vqUANreLHDv16-A1_zQW0PcV6gbmW1RyRaiJUt0PZb-uj4LWYhEDo_T9445Qf3FhUo&usqp=CAU",
      "date": "29 Oct 2024",
    },
  ];
}

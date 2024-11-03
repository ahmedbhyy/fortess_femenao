import 'package:get/get.dart';

abstract class ProjectDetailsController extends GetxController {
  updatereservation();
}

class ProjectDetailsControllerImp extends ProjectDetailsController {
  bool isreseved = false;
  @override
  updatereservation() {
    isreseved = true;
    update();
  }
}

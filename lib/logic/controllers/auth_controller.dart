import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isVisability = false;
  bool isCheckBox = false;

  void visability() {
    isVisability = !isVisability;
    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }
}

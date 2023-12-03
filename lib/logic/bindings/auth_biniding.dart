import 'package:get/get.dart';
import 'package:shoppp/logic/controllers/auth_controller.dart';

class AuthBiniding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}

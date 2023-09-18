import 'package:get/get.dart';
import 'package:mmo_app_template/screens/auth/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(LoginController.new);
  }
}

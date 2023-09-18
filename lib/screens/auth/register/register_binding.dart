
import 'package:get/get.dart';
import 'package:mmo_app_template/screens/auth/register/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(RegisterController.new);
  }
}

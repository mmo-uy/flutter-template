import 'package:get/get.dart';
import 'package:mmo_app_template/screens/welcome/welcome_controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(WelcomeController.new);
  }
}

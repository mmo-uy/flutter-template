import 'package:mmo_app_template/routes/app_pages.dart';
import 'package:get/get.dart';

abstract class RouteManagement {
  static void goToLoginView() {
    Get.offAllNamed(AppRoutes.login);
  }

  static void goToRegisterView() {
    Get.offAllNamed(AppRoutes.register);
  }

  static void goToWelcomeView() {
    Get.offAllNamed(AppRoutes.welcome);
  }

  static void goToHomeView() {
    Get.offAllNamed(AppRoutes.home);
  }

  static void goBack() {
    Get.back();
  }
}

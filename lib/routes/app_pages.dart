import 'package:get/get.dart';
import 'package:mmo_app_template/screens/auth/login/login_binding.dart';
import 'package:mmo_app_template/screens/auth/login/login_view.dart';
import 'package:mmo_app_template/screens/auth/register/register_binding.dart';
import 'package:mmo_app_template/screens/auth/register/register_view.dart';
import 'package:mmo_app_template/screens/home/home_binding.dart';
import 'package:mmo_app_template/screens/home/home_view.dart';
import 'package:mmo_app_template/screens/welcome/welcome_binding.dart';
import 'package:mmo_app_template/screens/welcome/welcome_view.dart';
part 'app_routes.dart';

abstract class AppPages {
  static var transitionDuration = const Duration(milliseconds: 400);

  static final pages = [
    GetPage(
      name: _Routes.welcome,
      page: WelcomeView.new,
      binding: WelcomeBinding(),
      transitionDuration: transitionDuration,
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: _Routes.login,
      page: LoginView.new,
      transitionDuration: transitionDuration,
      binding: LoginBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Routes.register,
      page: RegisterView.new,
      transitionDuration: transitionDuration,
      binding: RegisterBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Routes.home,
      page: HomeView.new,
      transitionDuration: transitionDuration,
      binding: HomeBinding(),
      transition: Transition.downToUp,
    ),
  ];
}

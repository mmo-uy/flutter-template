part of 'app_pages.dart';

abstract class AppRoutes {
  static const main = _Routes.main;
  static const welcome = _Routes.welcome;
  static const login = _Routes.login;
  static const register = _Routes.register;
  static const home = _Routes.home;
}

abstract class _Routes {
  static const main = '/';
  static const welcome = '/welcome';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
}

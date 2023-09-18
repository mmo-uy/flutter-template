import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mmo_app_template/helpers/utils.dart';

class WelcomeController extends GetxController {
  static WelcomeController get find => Get.find();
  // TODO Move to AuthController
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final FocusScopeNode focusNode = FocusScopeNode();
  final _showPassword = true.obs;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool get showPassword => _showPassword.value;

  void _clearLoginTextControllers() {
    usernameTextController.clear();
    passwordTextController.clear();
  }

  void toggleViewPassword() {
    _showPassword(!_showPassword.value);
    update();
  }

  _login({
    required String email,
    required String password,
  }) async {

  }

  Future<void> login() async {
    AppUtils.closeFocus();
    await _login(
      email: usernameTextController.text.trim(),
      password: passwordTextController.text.trim(),
    );
  }
}

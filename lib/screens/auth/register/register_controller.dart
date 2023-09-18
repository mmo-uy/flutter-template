import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmo_app_template/constants/strings.dart';
import 'package:mmo_app_template/helpers/utils.dart';
import 'package:mmo_app_template/routes/route_management.dart';

class RegisterController extends GetxController {
  static RegisterController get find => Get.find();
  // final _authProvider = AuthProvider(http.Client());
  // final _auth = AuthService.find;
  final fNameTextController = TextEditingController();
  final lNameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final unameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  final FocusScopeNode focusNode = FocusScopeNode();

  final _showPassword = true.obs;

  var _isLoading = false;
  bool get isLoading => _isLoading;

  bool get showPassword => _showPassword.value;

  void _clearRegisterTextControllers() {
    fNameTextController.clear();
    lNameTextController.clear();
    emailTextController.clear();
    unameTextController.clear();
    passwordTextController.clear();
    confirmPasswordTextController.clear();
  }

  void toggleViewPassword() {
    _showPassword(!_showPassword.value);
    update();
  }

  Future<void> _register(
    String email,
    String uname,
    String password,
    String confPassword,
  ) async {
    AppUtils.printLog("User Login Request...");
    AppUtils.showLoadingDialog();
    _isLoading = true;
    update();

  }

  Future<void> register() async {
    AppUtils.closeFocus();
    await _register(
      emailTextController.text.trim(),
      unameTextController.text.trim(),
      passwordTextController.text.trim(),
      confirmPasswordTextController.text.trim(),
    );
  }
}

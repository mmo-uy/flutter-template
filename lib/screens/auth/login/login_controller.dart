import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmo_app_template/constants/strings.dart';
import 'package:mmo_app_template/helpers/utils.dart';
import 'package:mmo_app_template/routes/route_management.dart';

import '../../../main.dart';

class LoginController extends GetxController {
  static LoginController get find => Get.find();

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final FocusScopeNode focusNode = FocusScopeNode();
  final _showPassword = true.obs;

  var _isLoading = false;
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

  Future<void> _login(String email, String password) async {
    AppUtils.printLog("User Login Request...");
    AppUtils.showLoadingDialog();
    _isLoading = true;
    update();

  }

  Future<void> login() async {
    AppUtils.closeFocus();
    await _login(
      usernameTextController.text.trim(),
      passwordTextController.text.trim(),
    );
  }
}

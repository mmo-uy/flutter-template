import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mmo_app_template/constants/colors.dart';
import 'package:mmo_app_template/constants/strings.dart';
import 'package:mmo_app_template/constants/themes.dart';

const appThemeModes = {
  StringValues.light,
  StringValues.dark,
  StringValues.system,
};

class AppThemeController extends GetxController {
  final themeData = GetStorage();

  final _themeMode = Rx(appThemeModes.first);

  String get themeMode => _themeMode.value;

  void getSystemChromeData() {
    var themeBrightness = SchedulerBinding.instance.window.platformBrightness;

    if (themeMode == kLightMode) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: ColorValues.lightBgColor,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: ColorValues.lightBgColor,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    } else if (themeMode == kDarkMode) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: ColorValues.darkBgColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: ColorValues.darkBgColor,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    } else {
      if (themeBrightness == Brightness.light) {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: ColorValues.lightBgColor,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: ColorValues.lightBgColor,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
        );
      } else {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: ColorValues.darkBgColor,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: ColorValues.darkBgColor,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        );
      }
    }
  }

  @override
  void onInit() {
    themeData.writeIfNull(StringValues.themeMode, appThemeModes.first);
    getThemeMode();
    super.onInit();
  }

  void setThemeMode(value) {
    _themeMode(value);
    themeData.write(StringValues.themeMode, value);
    update();
  }

  void getThemeMode() {
    String themeMode = themeData.read(StringValues.themeMode);
    _themeMode(themeMode);
    update();
  }
}

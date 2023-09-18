import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmo_app_template/constants/colors.dart';
import 'package:mmo_app_template/constants/dimens.dart';
import 'package:mmo_app_template/constants/strings.dart';

abstract class AppUtils {

  static void showLoadingDialog() {
    closeDialog();
    Get.dialog<void>(
      WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: CupertinoTheme(
              data: CupertinoTheme.of(Get.context!).copyWith(
                brightness: Brightness.dark,
                primaryColor: Colors.white,
              ),
              child: const CircularProgressIndicator(),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void showError(String message) {
    closeSnackBar();
    closeDialog();
    closeBottomSheet();
    if (message.isEmpty) return;
    Get.rawSnackbar(
      messageText: Text(
        message,
      ),
      mainButton: TextButton(
        onPressed: () {
          if (Get.isSnackbarOpen) {
            Get.back<void>();
          }
        },
        child: const Text(
          StringValues.okay,
        ),
      ),
      backgroundColor: const Color(0xFF503E9D),
      margin: Dimens.edgeInsets16,
      borderRadius: Dimens.fifteen,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  static void showBottomSheet(List<Widget> children, {double? borderRadius}) {
    closeBottomSheet();
    Get.bottomSheet(
      Padding(
        padding: Dimens.edgeInsets8_0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius ?? Dimens.zero),
          topRight: Radius.circular(borderRadius ?? Dimens.zero),
        ),
      ),
      barrierColor:
          Theme.of(Get.context!).textTheme.bodyText1!.color!.withAlpha(90),
      backgroundColor: Theme.of(Get.context!).bottomSheetTheme.backgroundColor,
    );
  }

  static void showOverlay(Function func) {
    Get.showOverlay(
      loadingWidget: const CupertinoActivityIndicator(),
      opacityColor: Theme.of(Get.context!).bottomSheetTheme.backgroundColor!,
      opacity: 0.5,
      asyncFunction: () async {
        await func();
      },
    );
  }

  static void showSnackBar(String message, SnackType type, {int? duration}) {
    closeSnackBar();
    Get.showSnackbar(
      GetSnackBar(
        margin: EdgeInsets.only(
          left: Dimens.sixTeen,
          right: Dimens.sixTeen,
          bottom: Dimens.thirtyTwo,
        ),
        borderRadius: Dimens.four,
        padding: Dimens.edgeInsets16,
        snackStyle: SnackStyle.FLOATING,
        messageText: Text(
          message,
          style: TextStyle(
            color: Theme.of(Get.context!).scaffoldBackgroundColor,
          ),
        ),
        icon: Icon(
          type == SnackType.ERROR
              ? CupertinoIcons.clear_circled_solid
              : type == SnackType.SUCCESS
                  ? CupertinoIcons.check_mark_circled_solid
                  : CupertinoIcons.info_circle_fill,
          color: type == SnackType.ERROR
              ? ColorValues.errorColor
              : type == SnackType.SUCCESS
                  ? ColorValues.successColor
                  : type == SnackType.WARNING
                      ? ColorValues.warningColor
                      : Theme.of(Get.context!).iconTheme.color,
        ),
        shouldIconPulse: false,
        backgroundColor: Theme.of(Get.context!).snackBarTheme.backgroundColor!,
        duration: Duration(seconds: duration ?? 2),
      ),
    );
  }

  /// Close any open snack bar.
  static void closeSnackBar() {
    if (Get.isSnackbarOpen) Get.back<void>();
  }

  /// Close any open dialog.
  static void closeDialog() {
    if (Get.isDialogOpen ?? false) Get.back<void>();
  }

  /// Close any open bottom sheet.
  static void closeBottomSheet() {
    if (Get.isBottomSheetOpen ?? false) Get.back<void>();
  }

  static void closeFocus() {
    if (FocusManager.instance.primaryFocus!.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  static void printLog(message) {
    debugPrint(
        "***********************************************************************");
    debugPrint(message.toString(), wrapWidth: 1024);
    debugPrint(
        "***********************************************************************");
  }

  static String generateRandomString({int? length}) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(
        length ?? 16, (index) => _chars[r.nextInt(_chars.length)]).join();
  }

  static String generateRandomNumber() {
    int min = 0;
    int max = 20000;

    int randomnum = min + Random().nextInt((max + 1) - min);
    return randomnum.toString();
  }
}

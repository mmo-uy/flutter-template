import 'package:flutter/material.dart';
import 'package:mmo_app_template/constants/dimens.dart';
import 'package:mmo_app_template/constants/strings.dart';
import 'package:mmo_app_template/controllers/theme_controller.dart';
import 'package:mmo_app_template/screens/home/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppThemeController appThemeController = Get.put(AppThemeController());
    return Scaffold(
      appBar: AppBar(
        title: Text(StringValues.appName.tr),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

            ],
          ),
        ),
      ),
    );
  }
}

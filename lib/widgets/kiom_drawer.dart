import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmo_app_template/constants/dimens.dart';

class KiomDrawer extends GetView {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Dimens.screenWidth * .8,
      elevation: 2,
      child: ColoredBox(
        color: Colors.white,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

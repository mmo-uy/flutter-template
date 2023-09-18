import 'package:flutter/material.dart';
import 'package:mmo_app_template/constants/dimens.dart';
abstract class AppStyles {

  static TextStyle get p => TextStyle(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w300,
    // fontFamily: defaultFontFamily,
    // height: defaultFontHeight,
  );
  static TextStyle style12Normal = TextStyle(
    fontSize: Dimens.twelve,
  );

  static TextStyle style12Bold = TextStyle(
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.bold,
  );

  static TextStyle style14Normal = TextStyle(
    fontSize: Dimens.fourteen,
  );

  static TextStyle style14Bold = TextStyle(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.bold,
  );

  static TextStyle style16Normal = TextStyle(
    fontSize: Dimens.sixTeen,
  );

  static TextStyle style16Bold = TextStyle(
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.bold,
  );

  static TextStyle style18Normal = TextStyle(
    fontSize: Dimens.eighteen,
  );

  static TextStyle style18Bold = TextStyle(
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.bold,
  );

  static TextStyle style20Normal = TextStyle(
    fontSize: Dimens.twenty,
  );

  static TextStyle style20Bold = TextStyle(
    fontSize: Dimens.twenty,
    fontWeight: FontWeight.bold,
  );

  static TextStyle style24Normal = TextStyle(
    fontSize: Dimens.twentyFour,
  );

  static TextStyle style24Bold = TextStyle(
    fontSize: Dimens.twentyFour,
    fontWeight: FontWeight.bold,
  );

  static TextStyle style32Normal = TextStyle(
    fontSize: Dimens.thirtyTwo,
  );

  static TextStyle style32Bold = TextStyle(
    fontSize: Dimens.thirtyTwo,
    fontWeight: FontWeight.bold,
  );
}

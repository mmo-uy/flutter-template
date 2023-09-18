import 'package:flutter/material.dart';
import 'package:mmo_app_template/constants/colors.dart';
import 'package:mmo_app_template/constants/dimens.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    Key? key,
    this.width,
    this.height,
    this.color,
    this.borderRadius,
  }) : super(key: key);
  final double? width;
  final double? height;
  final Color? color;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? ColorValues.grayColor.withOpacity(0.25),
        borderRadius: BorderRadius.circular(borderRadius ?? Dimens.zero),
      ),
    );
  }
}

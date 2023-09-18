import 'package:flutter/material.dart';
import 'package:mmo_app_template/constants/colors.dart';
import 'package:mmo_app_template/constants/dimens.dart';
import 'package:mmo_app_template/constants/styles.dart';

class NxCountWidget extends StatelessWidget {
  const NxCountWidget({
    Key? key,
    required this.title,
    required this.value,
    this.bgColor,
    this.padding,
    this.borderRadius,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String value;
  final Color? bgColor;
  final EdgeInsets? padding;
  final double? borderRadius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding ?? Dimens.edgeInsets4,
        decoration: BoxDecoration(
          color: bgColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius ?? Dimens.four),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: AppStyles.style16Bold,
            ),
            Text(
              title,
              style: const TextStyle(color: ColorValues.grayColor),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mmo_app_template/constants/colors.dart';
import 'package:mmo_app_template/constants/styles.dart';

class NxRadioTile extends StatelessWidget {
  const NxRadioTile(
      {Key? key,
      required this.onChanged,
      this.value,
      this.groupValue,
      required this.title,
      this.margin,
      this.padding,
      this.titleStyle,
      this.activeColor,
      this.onTap})
      : super(key: key);

  final Function(dynamic) onChanged;
  final dynamic value;
  final dynamic groupValue;
  final String title;
  final TextStyle? titleStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? activeColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: titleStyle ?? AppStyles.style18Normal,
            ),
            Transform.scale(
              scale: 1.5,
              child: Radio(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
                activeColor: activeColor ?? ColorValues.primaryColor,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

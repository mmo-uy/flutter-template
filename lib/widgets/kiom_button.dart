import 'package:mmo_app_template/constants/colors.dart';
import 'package:flutter/material.dart';

class KiomButton extends StatelessWidget {
  const KiomButton({
    Key? key,
    required this.label,
    this.labelFontSize,
    this.fillColor,
    required this.textColor,
    this.onPressed,
    this.paddingSymmetric,
  }) : super(key: key);
  final EdgeInsetsGeometry? paddingSymmetric;
  final String label;
  final double? labelFontSize;
  final Color? fillColor;
  final Color textColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingSymmetric ??
          const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RawMaterialButton(
            onPressed: onPressed,
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            fillColor: fillColor ?? ColorValues.kiomSoftSkyBlue,
            child: Text(
              label,
              style: TextStyle(
                fontSize: labelFontSize ?? 16.0,
                color: fillColor != null ? textColor : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

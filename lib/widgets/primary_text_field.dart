import 'package:flutter/material.dart';
import 'package:mmo_app_template/constants/colors.dart';
import 'package:mmo_app_template/constants/styles.dart';

class NxTextField extends StatelessWidget {
  const NxTextField({
    Key? key,
    this.icon,
    this.iconColor,
    this.label,
    this.editingController,
    this.onEditingComplete,
    this.hint,
    this.inputType,
    this.minLines,
    this.maxLines,
    this.readOnly,
    this.enabled,
    this.onChanged,
    this.onTap,
    this.initialValue,
  }) : super(key: key);

  final IconData? icon;
  final Color? iconColor;
  final String? label;
  final String? hint;
  final String? initialValue;
  final TextEditingController? editingController;
  final VoidCallback? onEditingComplete;
  final TextInputType? inputType;
  final int? minLines;
  final int? maxLines;
  final bool? readOnly;
  final bool? enabled;
  final Function(String)? onChanged;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          icon,
          color: iconColor ?? ColorValues.darkGrayColor,
        ),
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
      initialValue: initialValue,
      keyboardType: inputType ?? TextInputType.text,
      minLines: minLines ?? 1,
      maxLines: maxLines ?? 1,
      style: AppStyles.style16Normal,
      controller: editingController,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      readOnly: readOnly ?? false,
      enabled: enabled ?? true,
      scrollPhysics: const BouncingScrollPhysics(),
    );
  }
}

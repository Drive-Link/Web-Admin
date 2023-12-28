import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../resources/string_manager.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int maxLines;
  final Function(String?)? onChanged, onFieldSubmitted;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final AutovalidateMode autoValidateMode;
  final Function()? onTap;
  final Function()? showHideTap;
  final BorderRadius? borderRadius;
  final Color? filledColor;
  final FontWeight fontWeight;
  final int? maxLength;
  final bool filled;
  final TextStyle? style;
  final double? btnWidth;

  const CustomTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.textAlign,
    this.keyboardType,
    this.obscureText = false,
    this.filled = true,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.onChanged,
    this.controller,
    this.validator,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.onTap,
    this.borderRadius,
    this.filledColor,
    this.fontWeight = FontWeight.w400,
    this.maxLength,
    this.style,
    this.btnWidth,
    this.showHideTap
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 60,
          width: btnWidth ?? double.infinity,
          child: TextFormField(
            onTap: onTap,
            maxLines: maxLines,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: onFieldSubmitted,
            maxLength: maxLength,
            style: style ??
                TextStyle(
                  fontWeight: fontWeight,
                  decoration: TextDecoration.none,
                  fontSize: 16,
                  letterSpacing: 0.4,
                  fontFamily: StringManager.dmSans,
                ),
            autovalidateMode: autoValidateMode,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              counterText: '',
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 10,
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: textColor,
                fontWeight: FontWeight.w400,
                fontFamily: StringManager.dmSans,
                fontSize: 14,
              ),
              suffixIcon: GestureDetector(
                  onTap: showHideTap,
                  child: suffixIcon
              ),
              filled: filled,
              fillColor: customTextFieldColor,
            ),
            obscureText: obscureText,
            controller: controller,
            textAlign: textAlign ?? TextAlign.start,
            keyboardType: keyboardType,
            onSaved: onChanged,
            onChanged: onChanged,
            validator: validator,
            minLines: maxLines,
          ),
        ),
      ],
    );
  }
}

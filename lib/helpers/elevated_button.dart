import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'loading_animation.dart';

class BtnElevated extends StatelessWidget {
  final Widget child;
  final bool useFlexibleWith;
  final VoidCallback? onPressed;
  final double btnHeight, btnWidth, btnRadius;
  final bool isLoading;
  final ButtonStyle? buttonStyle;
  const BtnElevated(
      {Key? key,
        required this.child,
        this.btnHeight = 60,
        this.useFlexibleWith = false,
        this.btnRadius = 8,
        this.btnWidth = double.infinity,
        this.isLoading = false,
        this.buttonStyle,
        required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: btnHeight,
      width: useFlexibleWith == true ? null : btnWidth,
      child: ElevatedButton(
          style: buttonStyle ?? ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(btnRadius),
            ),
          ),
          onPressed: isLoading ? null : onPressed,
          child: isLoading ? const LoadingAnimation(color: primaryColor) : child),
    );
  }
}

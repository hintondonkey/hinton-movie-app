import 'package:flutter/material.dart';
import 'package:movie_app/presentation/styles/index.dart';

class SolidButton extends StatelessWidget {
  final Color? backgroundColor;
  final double? height;
  final double? width;

  final TextStyle? titleStyle;
  final String title;

  final VoidCallback? onPressed;
  final double borderRadius;
  final BorderSide? borderSide;

  const SolidButton({
    required this.title,
    this.height = 44,
    this.width,
    this.backgroundColor,
    this.titleStyle,
    this.onPressed,
    this.borderRadius = 3,
    this.borderSide,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: borderSide ?? BorderSide.none),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
            backgroundColor ?? AppColors.primaryBtnBgrColor),
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: Center(
          child: Text(title, style: titleStyle ?? titleMedium),
        ),
      ),
    );
  }
}

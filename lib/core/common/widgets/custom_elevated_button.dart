import 'package:flutter/material.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onPressed,
    required this.text,
    required this.width,
    required this.height,
    super.key,
    this.lastRadius,
    this.threeRadius,
    this.backgroundColor,
    this.textColor,
    this.textAlign,
    this.isLoading = false,
    this.loadingWidth = 30,
    this.loadingHeight = 30,
  });
  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;
  final double? threeRadius;
  final double? lastRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isLoading;
  final TextAlign? textAlign;
  final double? loadingWidth;
  final double? loadingHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(threeRadius ?? 15),
              topRight: Radius.circular(threeRadius ?? 15),
              bottomRight: Radius.circular(threeRadius ?? 15),
              bottomLeft: Radius.circular(lastRadius ?? 15),
            ),
          ),
        ),
        onPressed: onPressed,
        child: TextApp(
          text: text,
          theme: MarketiTextStyles.textStyle16.copyWith(
            color: textColor ?? MarketiColors.blackColor,
          ),
          textAlign: textAlign,
        ),
      ),
    );
  }
}

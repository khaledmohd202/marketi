import 'package:flutter/material.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';

class HomeSectionTitle extends StatelessWidget {
  const HomeSectionTitle({
    required this.onPressed,
    required this.sectionTitle,
    super.key,
  });
  final String sectionTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: sectionTitle,
          theme: MarketiTextStyles.textStyle18,
        ),

        InkWell(
          onTap: onPressed,
          child: TextApp(
            text: 'view all',
            theme: MarketiTextStyles.textStyle16.copyWith(
              color: MarketiColors.darkBlue100Color,
            ),
          ),
        ),
      ],
    );
  }
}

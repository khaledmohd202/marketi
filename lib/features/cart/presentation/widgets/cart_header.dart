import 'package:flutter/material.dart';
import 'package:marketi/core/common/widgets/custom_circle_avatar.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';

class CommonHeader extends StatelessWidget {
  const CommonHeader({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: CustomCircleAvatar(onTap: () {}),
      centerTitle: true,
      title: TextApp(
        text: title,
        theme: MarketiTextStyles.textStyle22.copyWith(
          color: MarketiColors.darkBlue900Color,
        ),
      ),
    );
  }
}

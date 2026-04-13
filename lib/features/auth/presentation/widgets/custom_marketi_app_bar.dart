import 'package:flutter/material.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/const/icons/marketi_icons.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';

class CustomMarketiAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomMarketiAppBar({
    required this.title, super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Image.asset(MarketiIcons.backButton),
      ),
      centerTitle: true,
      title: TextApp(
        text: title,
        theme: MarketiTextStyles.textStyle16.copyWith(
          color: MarketiColors.darkBlue100Color,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

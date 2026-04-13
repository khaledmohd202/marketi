import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/const/icons/marketi_icons.dart';
import 'package:marketi/core/extensions/navigation_extensions.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';

class ProductAppBar extends StatelessWidget {
  const ProductAppBar({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => context.pop(),
          icon: Image.asset(MarketiIcons.backButton),
        ),
        TextApp(text: title, theme: MarketiTextStyles.textStyle20),
        IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.shopping_cart_outlined,
            size: 24.sp,
            color: MarketiColors.lightBlue900Color,
          ),
        ),
      ],
    );
  }
}

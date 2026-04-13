import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/custom_circle_avatar.dart';
import 'package:marketi/core/const/icons/marketi_icons.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Image.asset(MarketiIcons.backButton),
        ),
        Text(
          'Search',
          style: MarketiTextStyles.textStyle20,
        ),
        CustomCircleAvatar(
          imageUrl: MarketiImages.khaled,
          radius: 30.r,
          height: 55.h,
          width: 55.w,
        ),
      ],
    );
  }
}

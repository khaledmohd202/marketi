import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.image,
    required this.title,
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 110.h,
            width: 100.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              //
              // ignore: deprecated_member_use
              // color:Colors.grey.withValues(alpha: 0.1)
              border: Border.all(
                color: MarketiColors.lightBlue100Color,
                // color: Colors.transparent,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              // child: Image.network(image, fit: BoxFit.cover),
              child: Image.asset(image, scale: 0.5, fit: BoxFit.fill),
            ),
          ),
          SizedBox(height: 5.h),
          TextApp(
            text: title,
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
            theme: MarketiTextStyles.textStyle14.copyWith(
              color: MarketiColors.darkBlue900Color,
            ),
          ),
        ],
      ),
    );
  }
}

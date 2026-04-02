import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key, this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60.h,
        width: 60.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          border: BoxBorder.all(
            color: MarketiColors.lightBlue500Color,
            width: 3.w,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: CircleAvatar(
            radius: 25.r,
            backgroundImage: const AssetImage(MarketiImages.khaled),
            // backgroundImage: NetworkImage(
            //   CacheHelper().getDataString(key: ApiKey.image) ??
            //       MarketiImages.khaled,
            // ),
          ),
        ),
      ),
    );
  }
}

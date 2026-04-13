import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    required this.height,
    required this.imageUrl,
    required this.radius,
    required this.width,
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;
  final double radius;
  final double width;
  final double height;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
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
            radius: radius,
            backgroundImage: AssetImage(imageUrl),
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

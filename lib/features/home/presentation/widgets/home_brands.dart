import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/const/images/marketi_images.dart';

class HomeBrands extends StatelessWidget {
  const HomeBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        // padding: EdgeInsets.symmetric(horizontal: 5.w),
        scrollDirection: Axis.horizontal,
        itemCount: _categoriesImages.length,
        separatorBuilder: (context, index) => SizedBox(width: 5.w),
        itemBuilder: (context, index) {
          return Container(
            width: 105.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  //
                  // ignore: deprecated_member_use
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10.r,
                ),
              ],
            ),
            // child: Image.network('', fit: BoxFit.contain),
            child: Image.asset(_categoriesImages[index], fit: BoxFit.contain),
          );
        },
      ),
    );
  }
}

final List<String> _categoriesImages = [
  MarketiImages.townTeamLogo,
  MarketiImages.jblLogo,
  MarketiImages.sonyLogo,
  MarketiImages.townTeamLogo,
  MarketiImages.jblLogo,
];

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/const/icons/marketi_icons.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';

class DeliveryTime extends StatelessWidget {
  const DeliveryTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
        color: MarketiColors.whiteColor,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: MarketiColors.darkBlue100Color),
      ),
      child: Row(
        children: [
          SizedBox(width: 10.w),
          Image.asset(MarketiIcons.deliveryIcon),
          SizedBox(width: 10.w),
          TextApp(
            text: 'Within 2 days',
            theme: MarketiTextStyles.textStyle14,
          ),
        ],
      ),
    );
  }
}

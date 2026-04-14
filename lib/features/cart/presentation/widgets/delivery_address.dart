import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: MarketiColors.darkBlue100Color),
      ),
      child: Column(
        children: [
          Image.asset(MarketiImages.address),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  // color: MarketiColors.darkBlue100Color,
                ),
                SizedBox(width: 10.w),
                TextApp(
                  text: 'Home',
                  theme: MarketiTextStyles.textStyle14,
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: TextApp(
                    text: 'Change',
                    theme: MarketiTextStyles.textStyle14.copyWith(
                      color: MarketiColors.darkBlue200Color,
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextApp(
            text: 'Anshas, Al-sharqia, Egypt.',
            theme: MarketiTextStyles.textStyle14.copyWith(
              color: MarketiColors.greyColor,
            ),
          ),
          TextApp(
            text: 'Mobile: +20 106 004 0675',
            theme: MarketiTextStyles.textStyle14.copyWith(
              color: MarketiColors.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}

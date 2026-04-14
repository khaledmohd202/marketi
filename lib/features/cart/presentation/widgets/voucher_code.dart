import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';

class VoucherCode extends StatelessWidget {
  const VoucherCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 250.w,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Voucher code',
              hintStyle: MarketiTextStyles.textStyle14.copyWith(
                color: MarketiColors.greyColor,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 12.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: const BorderSide(
                  color: MarketiColors.darkBlue100Color,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: const BorderSide(
                  color: MarketiColors.darkBlue100Color,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: const BorderSide(
                  color: MarketiColors.darkBlue100Color,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: MarketiColors.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.r),
              side: const BorderSide(
                color: MarketiColors.darkBlue100Color,
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 12.h,
            ),
          ),
          child: TextApp(
            text: 'Apply',
            theme: MarketiTextStyles.textStyle14.copyWith(
              color: MarketiColors.lightBlue900Color,
            ),
          ),
        ),
      ],
    );
  }
}

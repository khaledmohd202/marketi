import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/const/icons/marketi_icons.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
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
          Image.asset(MarketiIcons.cashIcon),
          SizedBox(width: 10.w),
          TextApp(
            text: 'Cash on Delivery',
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
    );
  }
}

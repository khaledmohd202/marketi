import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/custom_elevated_button.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';

class CartBottom extends StatelessWidget {
  const CartBottom({
    required this.totalItems,
    required this.totalPrice,
    required this.onPressed,
    super.key,
  });
  final String totalItems;
  final String totalPrice;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal ($totalItems items)',
                style: MarketiTextStyles.textStyle14.copyWith(
                  color: MarketiColors.greyColor,
                ),
              ),
              Text(
                'EGP $totalPrice',
                style: MarketiTextStyles.textStyle14.copyWith(
                  fontWeight: FontWeight.bold,
                  color: MarketiColors.darkBlue900Color,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          CustomButton(
            onPressed: onPressed,
            text: 'Checkout',
            width: double.infinity,
            height: 50.h,
            backgroundColor: MarketiColors.lightBlue900Color,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

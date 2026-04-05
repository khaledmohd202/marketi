import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';

class ProductBottomBar extends StatelessWidget {
  const ProductBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14.w, right: 14.w, bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextApp(
                text: 'Price',
                theme: MarketiTextStyles.textStyle16.copyWith(
                  color: Colors.grey,
                ),
              ),
              TextApp(
                text: '345.00 EGP',
                theme: MarketiTextStyles.textStyle18.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          // Important widget that make me add Icon and text
          // in the same line and
          // make the button size fit the content
          // without using the
          // GestureDetector => Container => Row => Icon + Text.
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: MarketiColors.lightBlue900Color,
              minimumSize: Size(230.w, 50.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
            ),
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            label: TextApp(
              text: 'Add to Cart',
              theme: MarketiTextStyles.textStyle18.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

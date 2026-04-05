import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  // double _rating = 4.0;

  // final TapGestureRecognizer _tapRecognizer = TapGestureRecognizer();

  // @override
  // void dispose() {
  //   _tapRecognizer.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                border: Border.all(color: MarketiColors.lightBlue900Color),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: TextApp(
                text: 'Free Shipping',
                theme: MarketiTextStyles.textStyle12.copyWith(
                  color: MarketiColors.lightBlue900Color,
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                // const Icon(Icons.star, color: Colors.amber, size: 16),
                RatingBar.builder(
                  initialRating: 4, // _rating
                  maxRating: 5,
                  itemSize: 16,
                  allowHalfRating: true,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (double value) {
                    debugPrint('Rating: $value');
                    // Set(() {
                    //  _rating = value;
                    // });
                  },
                ),
                SizedBox(width: 4.w),
                TextApp(
                  text: '4.0',
                  theme: MarketiTextStyles.textStyle12,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 8.h),
        TextApp(
          text: 'Pampers Swaddlers',
          theme: MarketiTextStyles.textStyle24.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        TextApp(
          text: 'Product Value',
          theme: MarketiTextStyles.textStyle16.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4.h),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    '''Fear no leaks with new and improved Pampers Swaddlers Pampers Swaddlers helps prevent up to 100% of leaks, even blowouts Plus, Dual Leak-Guard Barriers at the legs help protect where leaks happen most With Swaddlers, you can rest assured that you have superior leak protection* while keeping baby’s skin healthy ''',
                style: MarketiTextStyles.textStyle12.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: 'See more',
                style: MarketiTextStyles.textStyle12.copyWith(
                  color: MarketiColors.lightBlue900Color,
                  fontWeight: FontWeight.w500,
                ),
                // recognizer: _tapRecognizer
                //   ..onTap = () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

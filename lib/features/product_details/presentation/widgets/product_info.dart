import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';
import 'package:marketi/features/home/data/models/products/product_model.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({required this.product, super.key});

  final ProductModel product;

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
                  initialRating: product.rating, // _rating
                  maxRating: 5,
                  itemSize: 16,
                  allowHalfRating: true,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (_){},
                ),
                SizedBox(width: 4.w),
                TextApp(
                  text: product.rating.toString(),
                  theme: MarketiTextStyles.textStyle12,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 8.h),
        TextApp(
          // text: 'Pampers Swaddlers',
          text: product.title,
          theme: MarketiTextStyles.textStyle24.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        TextApp(
          text: 'Description',
          theme: MarketiTextStyles.textStyle16.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4.h),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: ''' ${product.description} ''',
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

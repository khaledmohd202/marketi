import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/dashed_divider.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/features/cart/presentation/widgets/receipt_text.dart';

class ReceiptWidget extends StatelessWidget {
  const ReceiptWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 105.h,
      decoration: BoxDecoration(
        color: MarketiColors.whiteColor,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: MarketiColors.darkBlue100Color),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: 5.w,
          vertical: 10.h,
        ),
        child: Column(
          children: [
            ReceiptText(
              text: 'Subtotal (${productImages.length} items)',
              price: totalPrice,
            ),
            SizedBox(height: 10.h),
            const ReceiptText(
              text: 'Delivery Fees',
              price: 10,
            ),
            SizedBox(height: 5.h),
            DashedDivider(
              indent: 8.w,
              endIndent: 3.w,
              color: MarketiColors.darkBlue100Color,
              height: 1.h,
              dashWidth: 6.w,
              dashSpace: 6.w,
            ),
            SizedBox(height: 5.h),

            ReceiptText(
              text: 'Total',
              price: totalPrice + 10,
            ),
          ],
        ),
      ),
    );
  }
}
double get totalPrice {
  return productPrices.fold(0, (sum, price) => sum + double.parse(price));
}

final List<String> productImages = [
  MarketiImages.pampersCart1,
  MarketiImages.pampersCart2,
  MarketiImages.pampersCart3,
  MarketiImages.pampersCart1,
  MarketiImages.pampersCart2,
  MarketiImages.pampersCart3,
];

final List<String> productNames = [
  'Pampers Swaddlers Diapers',
  'Seventh Generation Diapers',
  'Pampers Swaddlers Diapers',
  'Pampers Swaddlers Diapers',
  'Seventh Generation Diapers',
  'Pampers Swaddlers Diapers',
];

final List<String> productDescriptions = [
  '84 Diapers',
  '24 Diapers',
  '152 Diapers',
  '84 Diapers',
  '24 Diapers',
  '152 Diapers',
];

final List<String> productPrices = [
  '345.00',
  '88.00',
  '599.00',
  '345.00',
  '88.00',
  '599.00',
];

final List<String> productRatings = [
  '4.9',
  '4.6',
  '4.6',
  '4.9',
  '4.6',
  '4.6',
];

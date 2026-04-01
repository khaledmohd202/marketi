import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/product_card.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';

class HomeBestProduct extends StatelessWidget {
  const HomeBestProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 10.h),
      child: SizedBox(
        height: 255.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductCard(
              discount: _productDiscounts[index],
              image: _productImages[index],
              onTap: () {},
              color: Colors.blue,
              name: _productNames[index],
              price: _productPrices[index],
              rating: _productRates[index],
              selectedIcon: Icons.favorite,
              bottomAddWidget: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 35.h),
                    foregroundColor: Colors.white,
                    backgroundColor: MarketiColors.lightBlue700Color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),

                      side: BorderSide(
                        color: MarketiColors.lightBlue700Color,
                        width: 2.w,
                      ),
                    ),
                  ),
                  child: TextApp(
                    text: 'Add',
                    theme: MarketiTextStyles.textStyle16,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 10.w),
          itemCount: _productImages.length,
        ),
      ),
    );
  }
}

final List<String> _productImages = [
  MarketiImages.airbods,
  MarketiImages.smartTV,
  MarketiImages.motorilla,
];

final List<String> _productPrices = [
  '799',
  '13999',
  '8562',
];
final List<String> _productNames = [
  'Black JBL Airbods',
  'Sony Smart TV 55 inch',
  'Motorilla',
];

final List<double> _productRates = [4.9, 4.8, 3.2];

final List<String> _productDiscounts = [
  '10%',
  '5%',
  '60%',
];

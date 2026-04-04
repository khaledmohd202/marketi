import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/product_card.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';
import 'package:marketi/features/home/presentation/widgets/custom_view_all_app_bar.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomViewAllAppBar(title: 'Popular Products'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: _productImages.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5.w,
            crossAxisSpacing: 10.h,
            // childAspectRatio: 0.7,
            mainAxisExtent: 250.h,
          ),
          itemBuilder: (context, index) {
            return ProductCard(
              name: _productNames[index],
              price: _productPrices[index],
              rating: _productRates[index],
              onTap: () {},
              image: _productImages[index],
              selectedIcon: Icons.favorite,
              bottomAddWidget: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 35.h),
                    backgroundColor: Colors.white,
                    foregroundColor: MarketiColors.lightBlue700Color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      side: BorderSide(
                        color: MarketiColors.lightBlue700Color,
                        width: 1.w,
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
        ),
      ),
    );
  }
}

final List<String> _productNames = [
  'Wireless Headphones',
  'Smart Watch',
  'Laptop',
  'iPhone 11 Pro',
  'Motorola G Power',
  'AirPods Pro',
];

final List<String> _productPrices = [
  '499',
  '19800',
  '8579',
  '499',
  '19800',
  '8579',
  '499',
  '19800',
  '8579',
];

final List<double> _productRates = [
  4.5,
  4.0,
  4.8,
  4.2,
  4.6,
  4.3,
];

final List<String> _productImages = [
  MarketiImages.headphones,
  MarketiImages.smartWatch,
  MarketiImages.laptop,
  MarketiImages.iphone11Pro,
  MarketiImages.motorilla,
  MarketiImages.airbods,
];

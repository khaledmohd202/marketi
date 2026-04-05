import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/product_card.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/features/product_details/presentation/view/product_details.dart';

class HomePopularProduct extends StatelessWidget {
  const HomePopularProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 10.h),
      child: SizedBox(
        height: 205.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductCard(
              discount: _productDiscounts[index],
              image: _productImages[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const ProductDetails(),
                  ),
                );
              },
              // color: Colors.blue,
              name: _productNames[index],
              price: _productPrices[index],
              rating: _productRates[index],
              selectedIcon: Icons.favorite,
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
  MarketiImages.smartWatch,
  MarketiImages.iphone11Pro,
  MarketiImages.motorilla,
];

final List<String> _productPrices = [
  '499',
  '19800',
  '8579',
];
final List<String> _productNames = [
  'Smart Watch',
  'Iphone 11 Pro',
  'Motorilla',
];

final List<double> _productRates = [4.9, 4.5, 3.2];

final List<String> _productDiscounts = [
  '40%',
  '0.5%',
  '60%',
];

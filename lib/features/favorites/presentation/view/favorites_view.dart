import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/product_card.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_header.dart';
import 'package:marketi/features/home/presentation/widgets/home_search_bar.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        child: Column(
          children: [
            const CommonHeader(
              title: 'My Favorites',
            ),
            // HomeSearchBar(controller: _controller),
            SizedBox(height: 10.h),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                // padding: EdgeInsets.symmetric(horizontal: 15.w),
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
          ],
        ),
      ),
    );
  }
}

final List<String> _productImages = [
  MarketiImages.smartWatch,
  MarketiImages.iphone11Pro,
  MarketiImages.motorilla,
  MarketiImages.smartWatch,
  MarketiImages.iphone11Pro,
  MarketiImages.motorilla,
  MarketiImages.smartWatch,
  MarketiImages.iphone11Pro,
  MarketiImages.motorilla,
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
final List<String> _productNames = [
  'Smart Watch',
  'Iphone 11 Pro',
  'Motorilla',
  'Smart Watch',
  'Iphone 11 Pro',
  'Motorilla',
  'Smart Watch',
  'Iphone 11 Pro',
  'Motorilla',
];

final List<double> _productRates = [
  4.9,
  4.5,
  3.2,
  4.9,
  4.5,
  3.2,
  4.9,
  4.5,
  3.2,
];
//
// ignore: unused_element
final List<String> _productDiscounts = [
  '40%',
  '0.5%',
  '60%',
  '40%',
  '0.5%',
  '60%',
  '40%',
  '0.5%',
  '60%',
];

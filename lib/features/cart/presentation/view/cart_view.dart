import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/const/images/marketi_images.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_bottom.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_header.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_product_card.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        child: Column(
          children: [
            // Header
            const CartAndFavoriteHeader(
              title: 'My Cart',
            ),
            // Products List
            Expanded(
              child: ListView.separated(
                itemCount: _productImages.length,
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  return CartProductCard(
                    image: _productImages[index],
                    productTitle: _productNames[index],
                    description: _productDescriptions[index],
                    price: _productPrices[index],
                    rating: _productRatings[index],
                    selectedIcon: Icons.favorite,
                  );
                },
              ),
            ),
            // Checkout Button
            CartBottom(
              totalItems: _productImages.length.toString(),
              totalPrice: _totalPrice.toStringAsFixed(2),
              onPressed: () {
                // Handle checkout logic here
              },
            ),
          ],
        ),
      ),
    );
  }
}

double get _totalPrice {
  return _productPrices.fold(0, (sum, price) => sum + double.parse(price));
}

final List<String> _productImages = [
  MarketiImages.pampersCart1,
  MarketiImages.pampersCart2,
  MarketiImages.pampersCart3,
  MarketiImages.pampersCart1,
  MarketiImages.pampersCart2,
  MarketiImages.pampersCart3,
];

final List<String> _productNames = [
  'Pampers Swaddlers Diapers',
  'Seventh Generation Diapers',
  'Pampers Swaddlers Diapers',
  'Pampers Swaddlers Diapers',
  'Seventh Generation Diapers',
  'Pampers Swaddlers Diapers',
];

final List<String> _productDescriptions = [
  '84 Diapers',
  '24 Diapers',
  '152 Diapers',
  '84 Diapers',
  '24 Diapers',
  '152 Diapers',
];

final List<String> _productPrices = [
  '345.00',
  '88.00',
  '599.00',
  '345.00',
  '88.00',
  '599.00',
];

final List<String> _productRatings = [
  '4.9',
  '4.6',
  '4.6',
  '4.9',
  '4.6',
  '4.6',
];

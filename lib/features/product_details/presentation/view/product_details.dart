import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/features/product_details/presentation/widgets/product_app_bar.dart';
import 'package:marketi/features/product_details/presentation/widgets/product_bottom_bar.dart';
import 'package:marketi/features/product_details/presentation/widgets/product_images_slider.dart';
import 'package:marketi/features/product_details/presentation/widgets/product_info.dart';
import 'package:marketi/features/product_details/presentation/widgets/product_size_selector.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProductAppBar(title: 'Product Details'),
                const ProductImagesSlider(),
                SizedBox(height: 20.h),
                const ProductInfo(),
                SizedBox(height: 10.h),
                const ProductSizeSelector(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const ProductBottomBar(),
    );
  }
}

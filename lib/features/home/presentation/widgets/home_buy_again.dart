import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/product_card.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/loading/loading_shimmer.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';
import 'package:marketi/features/home/presentation/view_model/products/products_cubit.dart';
import 'package:marketi/features/product_details/presentation/view/product_details.dart';

class HomeBuyAgain extends StatelessWidget {
  const HomeBuyAgain({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return SizedBox(
            height: 205.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return LoadingShimmer(height: 200.h, width: 170.w);
              },
              separatorBuilder: (context, index) => SizedBox(width: 10.w),
              itemCount: 3,
            ),
          );
        }
        if (state is ProductsSuccess) {
          final products = state.products.skip(6).take(3).toList();

          return Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 10.h),
            child: SizedBox(
              height: 255.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ProductCard(
                    // discount: _productDiscounts[index],
                    image: products[index].thumbnail,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => const ProductDetails(),
                        ),
                      );
                    },
                    // color: Colors.blue,
                    name: products[index].title,
                    price: products[index].price.toString(),
                    rating: products[index].rating,
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
                itemCount: products.length,
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}

// final List<String> _productImages = [
//   MarketiImages.headphones,
//   MarketiImages.laptop,
//   MarketiImages.motorilla,
// ];

// final List<String> _productPrices = [
//   '399',
//   '14999',
//   '8562',
// ];
// final List<String> _productNames = [
//   'Black Sony Headphone',
//   'HP Chromebook laptop',
//   'Motorilla',
// ];

// final List<double> _productRates = [4.9, 4.8, 3.2];

// // final List<String> _productDiscounts = [
// //   '',
// //   '',
// //   '',
// // ];

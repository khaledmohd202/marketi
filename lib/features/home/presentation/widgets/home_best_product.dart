import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/product_card.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/loading/loading_shimmer.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';
import 'package:marketi/features/home/presentation/view_model/products/products_cubit.dart';

class HomeBestProduct extends StatelessWidget {
  const HomeBestProduct({super.key});

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
                return LoadingShimmer(height: 255.h, width: 170.w);
              },
              separatorBuilder: (context, index) => SizedBox(width: 10.w),
              itemCount: 3,
            ),
          );
        }
        if (state is ProductsSuccess) {
          final products = state.products.skip(3).take(3).toList();

          return Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 10.h),
            child: SizedBox(
              height: 255.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ProductCard(
                    discount: products[index].discountPercentage.toString(),
                    image: products[index].thumbnail,
                    onTap: () {},
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
//   MarketiImages.airbods,
//   MarketiImages.smartTV,
//   MarketiImages.motorilla,
// ];

// final List<String> _productPrices = [
//   '799',
//   '13999',
//   '8562',
// ];
// final List<String> _productNames = [
//   'Black JBL Airbods',
//   'Sony Smart TV 55 inch',
//   'Motorilla',
// ];

// final List<double> _productRates = [4.9, 4.8, 3.2];

// final List<String> _productDiscounts = [
//   '10%',
//   '5%',
//   '60%',
// ];

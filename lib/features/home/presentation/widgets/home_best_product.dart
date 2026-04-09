import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/loading/loading_shimmer.dart';
import 'package:marketi/core/common/widgets/product_card.dart';
import 'package:marketi/core/themes/colors/marketi_colors.dart';
import 'package:marketi/core/themes/styles/marketi_text_styles.dart';
import 'package:marketi/features/cart/presentation/view_model/cart_cubit.dart';
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
                    name: products[index].title,
                    price: products[index].price.toString(),
                    rating: products[index].rating,
                    selectedIcon: Icons.favorite,
                    bottomAddWidget: Builder(
                      builder: (context) {
                        final cartCubit = context.read<CartCubit>();
                        final isInCart = cartCubit.isInCart(
                          productId: products[index].id,
                        );
                        final isLoading = ValueNotifier<bool>(
                          false,
                        );

                        return ValueListenableBuilder<bool>(
                          valueListenable: isLoading,
                          builder: (context, loading, _) {
                            return Center(
                              child: ElevatedButton(
                                onPressed: (loading || isInCart)
                                    ? null
                                    : () async {
                                        isLoading.value = true;
                                        await cartCubit.addToCart(
                                          productId: products[index].id
                                              .toString(),
                                        );
                                        isLoading.value = false;
                                      },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 35.h),
                                  foregroundColor: Colors.white,
                                  backgroundColor: isInCart
                                      ? Colors.grey
                                      : MarketiColors.lightBlue700Color,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    side: BorderSide(
                                      color: isInCart
                                          ? Colors.grey
                                          : MarketiColors.lightBlue700Color,
                                      width: 2.w,
                                    ),
                                  ),
                                ),
                                child: loading
                                    ? SizedBox(
                                        height: 18.h,
                                        width: 18.w,
                                        child: const CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text(
                                        isInCart ? 'Added ✓' : 'Add',
                                        style: MarketiTextStyles.textStyle16,
                                      ),
                              ),
                            );
                          },
                        );
                      },
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

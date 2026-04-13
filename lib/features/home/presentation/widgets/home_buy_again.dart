import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/loading/loading_shimmer.dart';
import 'package:marketi/core/common/widgets/product_card.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/extensions/navigation_extensions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';
import 'package:marketi/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:marketi/features/favorites/presentation/view_model/favorite_cubit.dart';
import 'package:marketi/features/home/presentation/view_model/products/products_cubit.dart';

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
                  return BlocBuilder<FavoriteCubit, FavoriteState>(
                    builder: (context, state) {
                      final favoriteCubit = context.read<FavoriteCubit>();
                      final isFavorite = favoriteCubit.isInFavorites(
                        productId: products[index].id,
                      );

                      return ProductCard(
                        discount: products[index].discountPercentage.toString(),
                        image: products[index].thumbnail,
                        onTap: () => context.pushNamed(
                          AppRoutes.productDetails,
                          arguments: products[index].id,
                        ),
                        name: products[index].title,
                        price: products[index].price.toString(),
                        rating: products[index].rating,
                        selectedIcon: Icons.favorite,
                        isFavorite: isFavorite,
                        onFavoriteTap: () => isFavorite
                            ? favoriteCubit.deleteFromFavorites(
                                productId: products[index].id.toString(),
                              )
                            : favoriteCubit.addToFavorites(
                                productId: products[index].id.toString(),
                              ),
                        bottomAddWidget: BlocConsumer<CartCubit, CartState>(
                          listener: (context, cartState) {
                            if (cartState is AddToCartSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(cartState.message),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                            if (cartState is AddToCartFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(cartState.errorMessage),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          builder: (context, cartState) {
                            final cartCubit = context.read<CartCubit>();
                            final inCart = cartCubit.isInCart(
                              productId: products[index].id,
                            );
                            final isLoading = cartState is AddToCartLoading;

                            return Center(
                              child: ElevatedButton(
                                onPressed: (isLoading || inCart)
                                    ? null
                                    : () => cartCubit.addToCart(
                                        productId: products[index].id
                                            .toString(),
                                      ),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 35.h),
                                  foregroundColor: Colors.white,
                                  backgroundColor: inCart
                                      ? Colors.grey
                                      : MarketiColors.lightBlue700Color,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    side: BorderSide(
                                      color: inCart
                                          ? Colors.grey
                                          : MarketiColors.lightBlue700Color,
                                      width: 2.w,
                                    ),
                                  ),
                                ),
                                child: isLoading
                                    ? SizedBox(
                                        height: 18.h,
                                        width: 18.w,
                                        child: const CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      )
                                    : TextApp(
                                        text: inCart ? 'Added ✓' : 'Add',
                                        theme: MarketiTextStyles.textStyle16,
                                      ),
                              ),
                            );
                          },
                        ),
                      );
                    },
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

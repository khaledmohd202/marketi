import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/product_card.dart';
import 'package:marketi/core/common/widgets/text_app.dart';
import 'package:marketi/core/extensions/navigation_extensions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/theme/colors/marketi_colors.dart';
import 'package:marketi/core/theme/styles/marketi_text_styles.dart';
import 'package:marketi/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:marketi/features/favorites/presentation/view_model/favorite_cubit.dart';
import 'package:marketi/features/home/data/models/products/product_model.dart';

class ProductsHorizontalList extends StatelessWidget {
  const ProductsHorizontalList({
    required this.products,
    this.showAddToCartButton = true,
    super.key,
  });

  final List<ProductModel> products;
  final bool showAddToCartButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                bottomAddWidget: showAddToCartButton
                    ? BlocBuilder<CartCubit, CartState>(
                        builder: (context, cartState) {
                          final cartCubit = context.read<CartCubit>();
                          final inCart = cartCubit.isInCart(
                            productId: products[index].id,
                          );
                          // final isLoading = cartState is AddToCartLoading;
                          final isLoading =
                              cartCubit.loadingProductId ==
                              products[index].id.toString();

                          return Center(
                            child: ElevatedButton(
                              onPressed: (isLoading || inCart)
                                  ? () => cartCubit.deleteFromCart(
                                      productId: products[index].id.toString(),
                                    )
                                  : () => cartCubit.addToCart(
                                      productId: products[index].id.toString(),
                                    ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 35.h),
                                foregroundColor: Colors.white,
                                backgroundColor: inCart
                                    ? Colors.grey.withValues(alpha: 0.2)
                                    : MarketiColors.lightBlue700Color,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  side: BorderSide(
                                    color: inCart
                                        ? Colors.grey.withValues(alpha: 0.2)
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
                      )
                    : null,
              );
            },
          );
        },

        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemCount: products.length,
      ),
    );
  }
}

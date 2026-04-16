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

class SearchGridView extends StatelessWidget {
  const SearchGridView({
    required this.products,
    super.key,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5.w,
        crossAxisSpacing: 10.h,
        mainAxisExtent: 250.h,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, favState) {
            final favCubit = context.read<FavoriteCubit>();
            final isFav = favCubit.isInFavorites(
              productId: products[index].id,
            );
            return ProductCard(
              name: products[index].title,
              price: products[index].price.toString(),
              rating: products[index].rating,
              image: products[index].thumbnail,
              selectedIcon: Icons.favorite,
              isFavorite: isFav,
              onFavoriteTap: () => isFav
                  ? favCubit.deleteFromFavorites(
                      productId: products[index].id.toString(),
                    )
                  : favCubit.addToFavorites(
                      productId: products[index].id.toString(),
                    ),
              onTap: () => context.pushNamed(
                AppRoutes.productDetails,
                arguments: products[index].id,
              ),
              bottomAddWidget: BlocBuilder<CartCubit, CartState>(
                builder: (context, cartState) {
                  final cartCubit = context.read<CartCubit>();
                  final inCart = cartCubit.isInCart(productId: product.id);
                  final isLoading =
                      cartCubit.loadingProductId == product.id.toString();
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
                        minimumSize: Size(
                          double.infinity,
                          35.h,
                        ),
                        backgroundColor: inCart
                            ? Colors.grey.withValues(alpha: 0.2)
                            : MarketiColors.lightBlue700Color,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            20.r,
                          ),
                          side: BorderSide(
                            color: inCart
                                ? Colors.grey.withValues(
                                    alpha: 0.2,
                                  )
                                : MarketiColors.lightBlue700Color,
                            width: 1.w,
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
    );
  }
}

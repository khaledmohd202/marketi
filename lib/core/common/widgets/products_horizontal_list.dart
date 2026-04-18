import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/common/widgets/cart_button.dart';
import 'package:marketi/core/common/widgets/product_card.dart';
import 'package:marketi/core/extensions/navigation_extensions.dart';
import 'package:marketi/core/routing/app_routes.dart';
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
                    ? CartButton(productId: products[index].id)
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

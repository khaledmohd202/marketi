import 'package:flutter/material.dart';
import 'package:marketi/core/common/widgets/products_grid_view.dart';
import 'package:marketi/features/favorites/data/models/favorite_model.dart';

class FavoritesGridView extends StatelessWidget {
  const FavoritesGridView({
    required this.favorites,
    super.key,
  });

  final FavoriteModel favorites;

  @override
  Widget build(BuildContext context) {
    final list = favorites.favoritesList;
    return ProductsGridView(
      shrinkWrap: true,
      itemCount: list.length,
      idAt: (index) => list[index].id,
      titleAt: (index) => list[index].title,
      priceAt: (index) => list[index].price.toString(),
      ratingAt: (index) => list[index].rating,
      thumbnailAt: (index) => list[index].thumbnail,
    );
  }
}

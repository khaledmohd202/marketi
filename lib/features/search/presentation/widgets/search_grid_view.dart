import 'package:flutter/material.dart';
import 'package:marketi/core/common/widgets/products_grid_view.dart';
import 'package:marketi/features/home/data/models/products/product_model.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView({
    required this.products,
    super.key,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return ProductsGridView(
      itemCount: products.length,
      idAt: (index) => products[index].id,
      titleAt: (index) => products[index].title,
      priceAt: (index) => products[index].price.toString(),
      ratingAt: (index) => products[index].rating,
      thumbnailAt: (index) => products[index].thumbnail,
    );
  }
}

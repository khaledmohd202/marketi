import 'package:marketi/core/network/end_points.dart';
import 'package:marketi/features/home/data/models/products/product_model.dart';

class FavoriteModel {
  FavoriteModel({required this.favoritesList});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      favoritesList:
        (json[ApiKey.list] as List)
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    );
  }
  final List<ProductModel> favoritesList;
}

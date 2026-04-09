import 'package:marketi/core/network/end_points.dart';
import 'package:marketi/features/home/data/models/products/product_model.dart';

class CartModel {
  CartModel({required this.list});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      list: (json[ApiKey.list] as List)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  final List<ProductModel> list;
}

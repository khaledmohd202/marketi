import 'package:marketi/core/network/end_points.dart';
import 'package:marketi/features/home/data/models/products/product_model.dart';

class ProductsResponseModel {
  ProductsResponseModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductsResponseModel(
      products: (json[ApiKey.list] as List)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json[ApiKey.total] as int,
      skip: json[ApiKey.skip] as int,
      limit: json[ApiKey.limit] as int,
    );
  }
  final List<ProductModel> products;
  final int total;
  final int skip;
  final int limit;
}

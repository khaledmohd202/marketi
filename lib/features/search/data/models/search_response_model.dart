import 'package:marketi/core/network/end_points.dart';
import 'package:marketi/features/home/data/models/products/product_model.dart';

class SearchResponseModel {
  SearchResponseModel({
    required this.productsList,
    required this.skip,
    required this.limit,
    required this.total,
  });

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) {
    return SearchResponseModel(
      productsList: (json[ApiKey.list] as List)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      skip: json[ApiKey.skip] as int,
      limit: json[ApiKey.limit] as int,
      total: json[ApiKey.total] as int,
    );
  }

  final List<ProductModel> productsList;
  final int skip;
  final int limit;
  final int total;
}

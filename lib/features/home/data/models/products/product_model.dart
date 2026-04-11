import 'package:marketi/core/network/end_points.dart';

class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.thumbnail,
  });


  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: (json[ApiKey.id] as num?)?.toInt() ?? 0,
      title: json[ApiKey.title] as String? ?? '',
      description: json[ApiKey.description] as String? ?? '',
      category: json[ApiKey.category] as String? ?? '',
      price: (json[ApiKey.price] as num?)?.toDouble() ?? 0.0,
      discountPercentage:
          (json[ApiKey.discountPercentage] as num?)?.toDouble() ?? 0.0,
      rating: (json[ApiKey.rating] as num?)?.toDouble() ?? 0.0,
      stock: (json[ApiKey.stock] as num?)?.toInt() ?? 0,
      thumbnail: json[ApiKey.thumbnail] as String? ?? '',
    );
  }

  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String thumbnail;
}

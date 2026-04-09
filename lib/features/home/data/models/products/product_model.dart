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
      id: json[ApiKey.id] as int,
      title: json[ApiKey.title] as String,
      description: json[ApiKey.description] as String,
      category: json[ApiKey.category] as String,
      price: (json[ApiKey.price] as num).toDouble(),
      discountPercentage: (json[ApiKey.discountPercentage] as num).toDouble(),
      rating: (json[ApiKey.rating] as num).toDouble(),
      stock: json[ApiKey.stock] as int,
      thumbnail: json[ApiKey.thumbnail] as String,
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

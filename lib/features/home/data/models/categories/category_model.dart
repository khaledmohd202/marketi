import 'package:marketi/core/network/end_points.dart';

class CategoryModel {
  CategoryModel({
    required this.slug,
    required this.name,
    required this.url,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      slug: json[ApiKey.slug] as String,
      name: json[ApiKey.name] as String,
      url: json[ApiKey.url] as String,
      image: json[ApiKey.image] as String,
    );
  }

  final String slug;
  final String name;
  final String url;
  final String image;
}

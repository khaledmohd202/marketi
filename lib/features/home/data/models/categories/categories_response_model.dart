import 'package:marketi/core/network/end_points.dart';
import 'package:marketi/features/home/data/models/categories/category_model.dart';

class CategoriesResponseModel {
  CategoriesResponseModel({required this.categories});

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoriesResponseModel(
      categories: (json[ApiKey.list] as List)
      .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
      .toList()
    );
  }

  final List<CategoryModel> categories;
}

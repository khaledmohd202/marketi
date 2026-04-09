import 'package:marketi/core/network/end_points.dart';
import 'package:marketi/features/home/data/models/brands/brand_model.dart';

class BrandsResponseModel {
  BrandsResponseModel({required this.brands});

  factory BrandsResponseModel.fromJson(Map<String, dynamic> json) {
    return BrandsResponseModel(
      brands: (json[ApiKey.list] as List)
          .map((e) => BrandModel.fromJson(e  as Map<String, dynamic>))
          .toList(),
    );
  }

  final List<BrandModel> brands;
}

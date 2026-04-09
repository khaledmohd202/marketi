import 'package:marketi/core/network/end_points.dart';

class BrandModel {
  BrandModel({required this.name, required this.emoji});

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      name: json[ApiKey.name] as String,
      emoji: json[ApiKey.emoji] as String,
    );
  }

  final String name;
  final String emoji;
}

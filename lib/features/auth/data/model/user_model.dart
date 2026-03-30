import 'package:marketi/core/network/end_points.dart';

class UserModel {
  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json[ApiKey.name].toString(),
      email: json[ApiKey.email].toString(),
      phone: json[ApiKey.phone].toString(),
      role: json[ApiKey.role].toString(),
      image: json[ApiKey.image].toString(),
    );
  }

  final String name;
  final String email;
  final String phone;
  final String role;
  final String image;
}

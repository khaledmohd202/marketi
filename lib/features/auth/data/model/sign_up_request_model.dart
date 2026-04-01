import 'package:marketi/core/network/end_points.dart';

class SignUpRequestModel {
  SignUpRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKey.name: name,
      ApiKey.email: email,
      ApiKey.password: password,
      ApiKey.confirmPassword: confirmPassword,
      ApiKey.phone: phone,
    };
  }

  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;
}

import 'package:marketi/core/network/end_points.dart';

class SignInRequestModel {
  SignInRequestModel({required this.email, required this.password});


  Map<String, dynamic> toJson() {
    return {
      ApiKey.email: email,
      ApiKey.password: password,
    };
  }

  final String email;
  final String password;
}

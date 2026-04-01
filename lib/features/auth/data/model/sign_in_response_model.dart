import 'package:marketi/core/network/end_points.dart';
import 'package:marketi/features/auth/data/model/user_model.dart';

class SignInResponseModel {
  SignInResponseModel({
    required this.token,
    required this.message,
    required this.user,
  });

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) {
    return SignInResponseModel(
      token: json[ApiKey.token].toString(),
      message: json[ApiKey.message].toString(),
      user: UserModel.fromJson( json[ApiKey.user] as Map<String, dynamic>),
    );
  }

  final String token;
  final String message;
  final UserModel user;
}

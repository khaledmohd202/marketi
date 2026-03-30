import 'package:marketi/core/network/end_points.dart';

class SignUpResponseModel {
  SignUpResponseModel({required this.message});

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponseModel(
      message: json[ApiKey.message].toString(),
    );
  }

  final String message;
}

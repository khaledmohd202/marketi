import 'package:marketi/core/network/end_points.dart';

class ErrorModel {

  ErrorModel({required this.status, required this.errorMessage});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData[ApiKey.status] as int,
      errorMessage: jsonData[ApiKey.errorMessage] as String,
    );
  }
  final int status;
  final String errorMessage;
}

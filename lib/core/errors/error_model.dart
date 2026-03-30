import 'package:marketi/core/network/end_points.dart';

class ErrorModel {
  ErrorModel({required this.status, required this.errorMessage});

  factory ErrorModel.fromJson(
    Map<String, dynamic> jsonData, {
    int? statusCode,
  }) {
    return ErrorModel(
      status: statusCode ?? jsonData[ApiKey.status] as int? ?? 0,
      errorMessage:
          jsonData[ApiKey.errorMessage] as String? ??
          'Unexpected error occurred',
    );
  }

  final int status;
  final String errorMessage;
}

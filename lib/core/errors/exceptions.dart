import 'package:dio/dio.dart';
import 'package:marketi/core/errors/error_model.dart';

class ServerException implements Exception {
  ServerException({required this.errModel});
  final ErrorModel errModel;
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(
        errModel: ErrorModel.fromJson(e.response!.data as Map<String, dynamic>),
      );
    case DioExceptionType.sendTimeout:
      throw ServerException(
        errModel: ErrorModel.fromJson(e.response!.data as Map<String, dynamic>),
      );
    case DioExceptionType.receiveTimeout:
      throw ServerException(
        errModel: ErrorModel.fromJson(e.response!.data as Map<String, dynamic>),
      );
    case DioExceptionType.badCertificate:
      throw ServerException(
        errModel: ErrorModel.fromJson(e.response!.data as Map<String, dynamic>),
      );
    case DioExceptionType.cancel:
      throw ServerException(
        errModel: ErrorModel.fromJson(e.response!.data as Map<String, dynamic>),
      );
    case DioExceptionType.connectionError:
      throw ServerException(
        errModel: ErrorModel.fromJson(e.response!.data as Map<String, dynamic>),
      );
    case DioExceptionType.unknown:
      throw ServerException(
        errModel: ErrorModel.fromJson(e.response!.data as Map<String, dynamic>),
      );
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request
          throw ServerException(
            errModel: ErrorModel.fromJson(
              e.response!.data as Map<String, dynamic>,
            ),
          );
        case 401: //unauthorized
          throw ServerException(
            errModel: ErrorModel.fromJson(
              e.response!.data as Map<String, dynamic>,
            ),
          );
        case 403: //forbidden
          throw ServerException(
            errModel: ErrorModel.fromJson(
              e.response!.data as Map<String, dynamic>,
            ),
          );
        case 404: //not found
          throw ServerException(
            errModel: ErrorModel.fromJson(
              e.response!.data as Map<String, dynamic>,
            ),
          );
        case 409: //coefficient
          throw ServerException(
            errModel: ErrorModel.fromJson(
              e.response!.data as Map<String, dynamic>,
            ),
          );
        case 422: //  Unprocessable Entity
          throw ServerException(
            errModel: ErrorModel.fromJson(
              e.response!.data as Map<String, dynamic>,
            ),
          );
        case 504: // Server exception
          throw ServerException(
            errModel: ErrorModel.fromJson(
              e.response!.data as Map<String, dynamic>,
            ),
          );
      }
  }
}

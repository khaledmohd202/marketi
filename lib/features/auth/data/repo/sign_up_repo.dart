import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/server_exceptions.dart';
import 'package:marketi/core/network/api_consumer.dart';
import 'package:marketi/core/network/end_points.dart';
import 'package:marketi/features/auth/data/model/sign_up_request_model.dart';
import 'package:marketi/features/auth/data/model/sign_up_response_model.dart';

class SignUpRepo {
  SignUpRepo({required this.api});

  final ApiConsumer api;

  Future<Either<String, SignUpResponseModel>> signUp({
    required SignUpRequestModel signUpRequestModel,
  }) async {
    try {
      final response =
          await api.post(
                EndPoint.signUp,
                data: signUpRequestModel.toJson(),
              )
              as Map<String, dynamic>;

      final signUpResponse = SignUpResponseModel.fromJson(response);

      return Right(signUpResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}

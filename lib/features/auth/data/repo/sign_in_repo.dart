import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:marketi/core/errors/server_exceptions.dart';
import 'package:marketi/core/network/api_consumer.dart';
import 'package:marketi/core/network/end_points.dart';
import 'package:marketi/core/services/cache/cache_helper.dart';
import 'package:marketi/features/auth/data/model/sign_in_request_model.dart';
import 'package:marketi/features/auth/data/model/sign_in_response_model.dart';

class SignInRepo {
  SignInRepo({required this.api});

  final ApiConsumer api;

  Future<Either<String, SignInResponseModel>> signIn({
    required SignInRequestModel signInRequestModel,
  }) async {
    try {
      final response =
          await api.post(
                EndPoint.signIn,
                data: signInRequestModel.toJson(),
              )
              as Map<String, dynamic>;

      final user = SignInResponseModel.fromJson(response);
      await CacheHelper().saveData(key: ApiKey.token, value: user.token);

      final decodedToken = JwtDecoder.decode(user.token);
      await CacheHelper().saveData(
        key: ApiKey.id,
        value: decodedToken[ApiKey.id],
      );

      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}

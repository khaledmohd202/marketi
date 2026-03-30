import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/exceptions.dart';
import 'package:marketi/core/network/api_consumer.dart';
import 'package:marketi/core/network/end_points.dart';
import 'package:marketi/core/services/cache/cache_helper.dart';
import 'package:marketi/features/auth/data/model/user_model.dart';

class UserRepo {
  UserRepo({required this.api});

  final ApiConsumer api;

  Future<Either<String, UserModel>> getUserData() async {
    try {
      final response =
          await api.get(
                EndPoint.getUserDataEndPoint(
                  CacheHelper().getData(key: ApiKey.id).toString(),
                ),
              )
              as Map<String, dynamic>;

      return Right(UserModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}

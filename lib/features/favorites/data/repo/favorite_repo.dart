import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/server_exceptions.dart';
import 'package:marketi/core/network/api_consumer.dart';
import 'package:marketi/core/network/end_points.dart';
import 'package:marketi/features/favorites/data/models/favorite_model.dart';

class FavoriteRepo {
  FavoriteRepo(this.api);

  final ApiConsumer api;

  // Get Favorite Products to Favorites View.
  Future<Either<String, FavoriteModel>> getFavorites() async {
    try {
      final response =
          await api.get(EndPoint.getFavorites) as Map<String, dynamic>;

      return Right(FavoriteModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  // Add a Product to favorites View.
  Future<Either<String, String>> addToFavorites({
    required String productId,
  }) async {
    try {
      final response =
          await api.post(
                EndPoint.addToFavorites,
                data: {ApiKey.productId: productId},
              )
              as Map<String, dynamic>;

      return Right(response[ApiKey.message] as String);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  // Delete Product From Favorites View.
  Future<Either<String, String>> deleteFromFavorites({
    required String productId,
  }) async {
    try {
      final response =
          await api.delete(
                EndPoint.deleteFromFavorites,
                data: {ApiKey.productId: productId},
              )
              as Map<String, dynamic>;

      return Right(response[ApiKey.message] as String);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}

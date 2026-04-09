import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/server_exceptions.dart';
import 'package:marketi/core/network/api_consumer.dart';
import 'package:marketi/core/network/end_points.dart';
import 'package:marketi/features/home/data/models/categories/categories_response_model.dart';

class CategoriesRepo {
  CategoriesRepo(this.api);

  final ApiConsumer api;

  Future<Either<String, CategoriesResponseModel>> getAllCategories() async {
    try {
      final response =
          await api.get(EndPoint.categories) as Map<String, dynamic>;

      return Right(CategoriesResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}

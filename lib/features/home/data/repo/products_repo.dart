import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/server_exceptions.dart';
import 'package:marketi/core/network/api_consumer.dart';
import 'package:marketi/core/network/end_points.dart';
import 'package:marketi/features/home/data/models/products/products_response_model.dart';

class ProductsRepo {
  ProductsRepo(this.api);

  final ApiConsumer api;

  Future<Either<String, ProductsResponseModel>> getAllProducts({
    required int skip,
    int limit = 10,
  }) async {
    try {
      final response = await api.get(
        EndPoint.products,
        queryParameters: {'skip': skip, 'limit': limit},
      );

      if (response == null) return const Left('No data received');

      return Right(
        ProductsResponseModel.fromJson(response as Map<String, dynamic>),
      );
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}

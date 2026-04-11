import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/server_exceptions.dart';
import 'package:marketi/core/network/api_consumer.dart';
import 'package:marketi/core/network/end_points.dart';
import 'package:marketi/features/home/data/models/products/product_model.dart';

class ProductDetailsRepo {
  ProductDetailsRepo(this.api);

  final ApiConsumer api;

  Future<Either<String, ProductModel>> getProductDetails({
    required int productId,
  }) async {
    try {
      final response = await api.get(
        EndPoint.productDetails,
        queryParameters: {
          ApiKey.id: productId,
        },
      );

      if (response == null) return const Left('No data received');

      return Right(ProductModel.fromJson(response as Map<String, dynamic>));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}

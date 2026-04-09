import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/server_exceptions.dart';
import 'package:marketi/core/network/api_consumer.dart';
import 'package:marketi/core/network/end_points.dart';
import 'package:marketi/features/cart/data/models/cart_model.dart';

class CartRepo {
  CartRepo(this.api);

  final ApiConsumer api;

  // Get All Products in Cart.
  Future<Either<String, CartModel>> getCart() async {
    try {
      final response = await api.get(EndPoint.getCart) as Map<String, dynamic>;

      return Right(CartModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  // Add a Product To Cart.
  Future<Either<String, String>> addToCart({required String productId}) async {
    try {
      final response =
          await api.post(
                EndPoint.addToCart,
                data: {ApiKey.productId: productId},
              )
              as Map<String, dynamic>;

      return Right(response[ApiKey.message] as String);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  // Delete a product From Cart.
  Future<Either<String, String>> deleteFromCart({
    required String productId,
  }) async {
    try {
      final response =
          await api.delete(
                EndPoint.deleteFromCart,
                data: {
                  ApiKey.productId: productId,
                },
              )
              as Map<String, dynamic>;

      return Right(response[ApiKey.message] as String);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/server_exceptions.dart';
import 'package:marketi/core/network/api_consumer.dart';
import 'package:marketi/core/network/end_points.dart';
import 'package:marketi/features/home/data/models/brands/brands_response_model.dart';

class BrandsRepo {
  BrandsRepo(this.api);

  final ApiConsumer api;

  Future<Either<String, BrandsResponseModel>> getAllBrands() async {
    try {
      final response = await api.get(EndPoint.brands) as Map<String, dynamic>;

      return Right(BrandsResponseModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}

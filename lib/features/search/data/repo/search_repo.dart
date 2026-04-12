import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/server_exceptions.dart';
import 'package:marketi/core/network/api_consumer.dart';
import 'package:marketi/core/network/end_points.dart';
import 'package:marketi/features/search/data/models/search_request_model.dart';
import 'package:marketi/features/search/data/models/search_response_model.dart';

class SearchRepo {
  SearchRepo(this.api);

  final ApiConsumer api;

  Future<Either<String, SearchResponseModel>> search({
    required SearchRequestModel searchRequest,
  }) async {
    try {
      final response = await api.post(
        EndPoint.search,
        data: searchRequest.toJson(),
      );

      if (response == null) return const Left('No data received');

      return Right(
        SearchResponseModel.fromJson(response as Map<String, dynamic>),
      );
    } on ServerException catch (e) {
      if (e.errModel.status == 404) {
        return Right(
          SearchResponseModel(
            total: 0,
            skip: 0,
            limit: 0,
            productsList: [],
          ),
        );
      }
      return Left(e.errModel.errorMessage);
    }
  }
}

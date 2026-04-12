import 'package:marketi/core/network/end_points.dart';

class SearchRequestModel {
  SearchRequestModel({
    required this.searchQuery,
    this.skip = 0,
    this.limit = 10,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKey.search: searchQuery,
      ApiKey.skip: skip,
      ApiKey.limit: limit,
    };
  }

  final String searchQuery;
  final int skip;
  final int limit;
}

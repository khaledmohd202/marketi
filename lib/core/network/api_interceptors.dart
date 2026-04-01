import 'package:dio/dio.dart';
import 'package:marketi/core/network/end_points.dart';
import 'package:marketi/core/services/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.token] =
        CacheHelper().getData(key: ApiKey.token) != null
            ? 'FI ${CacheHelper().getData(key: ApiKey.token)}'
            : null;
    super.onRequest(options, handler);
  }
}

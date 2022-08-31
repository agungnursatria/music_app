// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';

class NetworkLibrary {
  static const int TIMEOUT_MILLISECOND = 7000;

  Dio getDio(Map<String, String>? headers) {
    var dio = Dio();
    dio.options.connectTimeout = TIMEOUT_MILLISECOND;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          if (headers != null) options.headers.addAll(headers);
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (DioError error, ErrorInterceptorHandler handler) {
          return handler.next(error);
        },
      ),
    );
    return dio;
  }
}

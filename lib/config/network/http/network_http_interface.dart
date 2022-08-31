// ignore_for_file: prefer_final_fields

import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:music_app/config/environment/env.dart';
import 'package:music_app/config/network/constant/constant.dart';
import 'package:music_app/config/network/error/network_error.dart';
import 'package:music_app/config/network/error/network_error_type.dart';
import 'package:music_app/config/network/http/network_http_library.dart';
import 'package:music_app/config/network/http/network_http_model.dart';
import 'package:music_app/utils/helper.dart';

class NetworkHttpInterface {
  final NetworkLibrary _library;
  NetworkHttpInterface({required NetworkLibrary library}) : _library = library;

  Future<Either<NetworkModel, NetworkError>> requestGetNoAuth({
    String? baseUrl,
    String? path,
    Map<String, dynamic>? queryParameters,
  }) async {
    baseUrl ??= Env().baseUrl;
    try {
      return await _library
          .getDio(_buildHeaderBasic())
          .get("$baseUrl$path", queryParameters: queryParameters)
          .then(_parseResponse);
    } catch (e, s) {
      if (e is! DioError) Helper.catchError(e, s);
      return Right(_getError(e));
    }
  }

  Map<String, String> _buildHeaderBasic() {
    var headers = <String, String>{};
    headers.putIfAbsent("content-type", () {
      return "application/json";
    });

    return headers;
  }

  FutureOr<Either<NetworkModel, NetworkError>> _parseResponse(
    Response<dynamic> jsonResponse,
  ) {
    return Left(NetworkModel(
      code: jsonResponse.statusCode,
      response: jsonDecode(jsonResponse.data),
    ));
  }

  NetworkError _getError(Object e) {
    String errorMessage = NetworkConstant.unknownErrorMessage;
    NetworkErrorType errorType = NetworkErrorType.Undefined;
    if (e is DioError) {
      var data = e.response?.data;
      errorMessage = _getErrorMessage(data);
      int? code = e.response?.statusCode ?? _getErrorCodeByType(e);
      errorType = NetworkErrorTypeParser.httpToErrorType(code);
    }
    return NetworkError(errorMessage, errorType);
  }

  String _getErrorMessage(dynamic data) {
    if (data != null) {
      if (data.runtimeType is Map || data.toString()[0] == "{") {
        if (data['error'] != null) {
          return data['error'];
        } else if (data['message'] != null) {
          return data['message'];
        }
      }
    }
    return NetworkConstant.unknownErrorMessage;
  }

  int _getErrorCodeByType(DioError e) {
    switch (e.type) {
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.connectTimeout:
        return NetworkConstant.ConnectionTimeoutErrorCode;
      default:
        return NetworkConstant.NoConnectionErrorCode;
    }
  }
}

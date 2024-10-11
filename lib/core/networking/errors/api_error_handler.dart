import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      log("error.message", name: "ApiErrorHandler handle");
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Connection to server failed");
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request to the server was cancelled");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "Connection timeout with the server");
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              message: "Receive timeout in connection with the server");
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              message: "Send timeout in connection with the server");
        case DioExceptionType.unknown:
          return ApiErrorModel(
              message:
                  "Connection to the server failed due to internet connection");
        case DioExceptionType.badResponse:
          return _handleError(error.response?.statusCode, error.response?.data);
        default:
          return ApiErrorModel(message: "Something went wrong");
      }
    } else if (error is IOException) {
      return ApiErrorModel(message: "No internet connection");
    } else {
      return ApiErrorModel(message: "Unknown error occurred");
    }
  }
}

ApiErrorModel _handleError(int? statusCode, dynamic data) {
  log("error.message", name: "ApiErrorHandler _handleError");
  return ApiErrorModel(
    statusCode: data['code'] ?? statusCode,
    message: data['message'] ?? "Unknown error occurred",
    data: data['stack'],
  );
}

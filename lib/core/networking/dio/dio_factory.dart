import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@injectable
class DioFactory {
  DioFactory();

  @factoryMethod
  Dio createDio() {
    Duration timeOut = const Duration(seconds: 60);
    Dio dio = Dio();
    dio
      ..options.connectTimeout = timeOut
      ..options.receiveTimeout = timeOut
      ..options.validateStatus = (status) {
        return status != null ? status == 200 || status == 201 : false;
      };

    addFreeDioInterceptors(dio);
    return dio;
  }

  void addFreeDioInterceptors(Dio dio) {
    dio.interceptors.addAll(
      [
        !kReleaseMode
            ? PrettyDioLogger(
                requestBody: true,
                requestHeader: true,
                responseHeader: true,
              )
            : const Interceptor(),
      ],
    );
  }
}

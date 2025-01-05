import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:telsa_mobile/core/dio/intercepter.dart';

class AppNetwork {
  Dio provideDio() {
    Dio dio = Dio(BaseOptions(
      headers: {
        'Content-Type': 'application/json',
      },
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      extra: {'withCredentials': true},
    ));

    dio.interceptors.add(RequestInterceptor());
    dio.interceptors.add(CurlLoggerDioInterceptor());

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 100,
      ),
    );
    return dio;
  }
}

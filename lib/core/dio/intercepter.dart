import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:telsa_mobile/common/local/local_storage.dart';
import 'package:telsa_mobile/common/widgets/toast/app_toast.dart';
import 'package:telsa_mobile/core/di/di.dart';

class RequestInterceptor extends Interceptor {
  final Map<String, String>? headers;
  final SharedPrefs _sharedPrefs = SharedPrefs();
  final Logger logger = di.get();

  RequestInterceptor({
    this.headers,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final cookies = _sharedPrefs.getCookies();
    if (cookies != null && cookies.isNotEmpty) {
      options.headers['Cookie'] = cookies;
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final cookies = response.headers['set-cookie'];
    if (cookies != null && cookies.isNotEmpty) {
      _sharedPrefs.setCookies(cookies);
    }
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        throw ConnectionTimeOutException(err.requestOptions);
      case DioExceptionType.sendTimeout:
        throw SendTimeOutException(err.requestOptions);
      case DioExceptionType.receiveTimeout:
        throw ReceiveTimeOutException(err.requestOptions);
      // case DioExceptionType.badResponse:
      //   throw BadResponseException(err.requestOptions, err.response);
      default:
        if (err.response?.statusCode == 404) {
          AppToast.toastError('Resource not found');
          break;
        }

        AppToast.toastError(err.response?.data['message'] ?? err.message);

        break;
    }
    return handler.next(err);
  }
}

class ConnectionTimeOutException extends DioException {
  ConnectionTimeOutException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Connection Timed out, Please try again';
  }
}

class SendTimeOutException extends DioException {
  SendTimeOutException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Send Timed out, Please try again';
  }
}

class ReceiveTimeOutException extends DioException {
  ReceiveTimeOutException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Receive Timed out, Please try again';
  }
}

class BadResponseException extends DioException {
  BadResponseException(
    RequestOptions r,
    Response? response,
  ) : super(requestOptions: r, response: response);

  @override
  String toString() {
    return 'Bad Response, Please try again';
  }
}

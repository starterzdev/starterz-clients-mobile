import 'package:dio/dio.dart';

class BackendClientProvider {
  static const BASE_URL = "http://192.168.2.16:8080/api/";

  static Dio generateDefaultDio() {
    return Dio(BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: 10000,
      receiveTimeout: 10000,
    ))
      ..interceptors.addAll([
        LogInterceptor(
          responseBody: true,
        ),
      ]);
  }
}

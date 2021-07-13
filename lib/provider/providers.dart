import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starterz/provider/auth/auth_notifier.dart';
import 'package:starterz/provider/auth/auth_state.dart';

final backendClientProvider = FutureProvider<Dio>((ref) async {
  const baseUrl = "http://192.168.2.16:8080/api/v1/";
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 5000,
    receiveTimeout: 5000,
  ));
  dio.interceptors.addAll([
    LogInterceptor(
      responseBody: true,
    ),
  ]);
  try {
    await dio.get("actuator/health");
    Timer.periodic(Duration(minutes: 1), (timer) => dio.get("actuator/health"));
  } on DioError {
    print('Health Check failed...');
  }
  return dio;
});

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) => AuthNotifier(ref.read, AuthState.notAuthenticated()));

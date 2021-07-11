import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starterz/provider/auth/auth_notifier.dart';
import 'package:starterz/provider/auth/auth_state.dart';
import 'package:starterz/provider/kakao/kakao_service.dart';

final backendClientProvider = FutureProvider<Dio>((ref) async {
  const baseUrl = "http://192.168.2.16:8080/api/v1/";
  final dio = new Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 5000,
    receiveTimeout: 5000,
  ));
  dio.interceptors.addAll([
    LogInterceptor(
      responseBody: true,
    )
  ]);
  await dio.get("actuator/health");
  Timer.periodic(Duration(seconds: 10), (timer) => dio.get("actuator/health"));
  return dio;
});
final kakaoServiceProvider = Provider((ref) => KakaoService());
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) => AuthNotifier(ref.read, AuthState.notAuthenticated()));

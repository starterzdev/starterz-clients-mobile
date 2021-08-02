import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starterz/provider/auth/auth_notifier.dart';
import 'package:starterz/provider/auth/auth_state.dart';
import 'package:starterz/provider/bottom_navigation/bottom_navigation_notifier.dart';
import 'package:starterz/provider/bottom_navigation/bottom_navigation_state.dart';
import 'package:starterz/utils/backend_client_provider.dart';

final backendClientProvider = Provider<Dio>((ref) {
  final dio = BackendClientProvider.generateDefaultDio();
  dio.interceptors.addAll([
    InterceptorsWrapper(onRequest: (options, handler) {
      ref.read(authProvider).maybeWhen(
          authenticated: (token) {
            options.headers['Authorization'] = "Bearer $token";
            handler.next(options);
          },
          orElse: () => handler.next(options));
    }, onError: (e, handler) async {
      if (e.response?.statusCode == 401 &&
          e.requestOptions.path != 'api/v1/auth') {
        dio.lock();
        await ref.read(authProvider.notifier).refreshKakaoToken();
        ref.read(authProvider).maybeWhen(
          authenticated: (token) async {
            RequestOptions request = e.response!.requestOptions;
            request.headers["Authorization"] = "Bearer $token";
            dio.unlock();
            var response = await dio.request(
              request.path,
              data: request.data,
              options: Options(
                method: request.method,
                headers: request.headers,
                contentType: request.contentType,
              ),
            );
            return handler.resolve(response);
          },
          orElse: () {
            dio.unlock();
            return handler.reject(e);
          },
        );
      }
    })
  ]);
  dio
      .get("actuator/health")
      .then((value) => Timer.periodic(
          Duration(minutes: 1), (timer) => dio.get("actuator/health")))
      .catchError((e) {
    print('Health Check failed...');
  });
  return dio;
});

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    BackendClientProvider.generateDefaultDio(),
    AuthState.loading(),
  );
});

final bottomNavigationProvider =
    StateNotifierProvider<BottomNavigationNotifier, BottomNavigationState>(
        (ref) => BottomNavigationNotifier(BottomNavigationState.myProject()));

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:starterz/main.dart';
import 'package:starterz/provider/auth/auth_state.dart';
import 'package:starterz/provider/auth/domain/auth_request.dart';
import 'package:starterz/provider/auth/domain/auth_response.dart';
import 'package:starterz/provider/auth/domain/check_token_request.dart';
import 'package:starterz/provider/auth/domain/integrate_request.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  static const String BACKEND_TOKEN_KEY_NAME = 'backendToken';
  final Dio _dio;

  AuthNotifier(this._dio, AuthState state) : super(state) {
    checkBackendToken();
  }

  Future<void> checkBackendToken() async {
    try {
      state = AuthState.loading();
      final String? backendToken =
          await secureStorage.read(key: BACKEND_TOKEN_KEY_NAME);
      if (backendToken == null) {
        state = AuthState.notAuthenticated();
        return;
      }
      await _dio.post(
        'v1/auth/checkToken',
        data: CheckTokenRequest(token: backendToken).toJson(),
      );
      state = AuthState.authenticated(backendToken);
    } on DioError catch (e) {
      if (e.response?.statusCode == HttpStatus.unauthorized) {
        await refreshKakaoToken();
      } else {
        state = AuthState.notAuthenticated();
      }
    }
  }

  Future<void> refreshKakaoToken() async {
    try {
      print('Refreshing Kakao token...');
      state = AuthState.loading();
      final OAuthToken token = await AccessTokenStore.instance.fromStore();
      print("Verifying Kakao access token... ${token.accessToken}");
      await _authenticateBackend(token.accessToken!);
    } catch (e) {
      state = AuthState.notAuthenticated();
    }
  }

  Future<void> loginWithKakao() async {
    try {
      state = AuthState.loading();
      KakaoContext.clientId = "73d19306c0fb4b4a496c0377eac5768a";
      final isKakaoInstalled = await isKakaoTalkInstalled();
      isKakaoInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();
      final OAuthToken token = await AccessTokenStore.instance.fromStore();
      await _authenticateBackend(token.accessToken!);
    } on DioError catch (e) {
      if (e.response?.statusCode == HttpStatus.notFound) {
        state = AuthState.integrationRequired();
      } else {
        state = AuthState.notAuthenticated();
      }
      print(e);
    } catch (e) {
      state = AuthState.notAuthenticated();
      print(e);
    }
  }

  Future<void> logoutFromKakao() async {
    state = AuthState.loading();
    await secureStorage.delete(key: BACKEND_TOKEN_KEY_NAME);
    await UserApi.instance.logout();
    state = AuthState.notAuthenticated();
  }

  Future<void> integrate(String email) async {
    try {
      state = AuthState.loading();
      final OAuthToken token = await AccessTokenStore.instance.fromStore();
      await _dio.post(
        'v1/auth/integrate',
        data: IntegrateRequest(
          email: email,
          authType: AuthType.KAKAO,
          oAuthToken: token.accessToken!,
        ).toJson(),
      );
      state = AuthState.verificationRequired();
    } on DioError catch (e) {
      if (e.response?.statusCode == HttpStatus.notFound) {
        state = AuthState.registrationRequired();
      } else {
        state = AuthState.notAuthenticated();
      }
    } catch (e) {
      print(e);
      state = AuthState.notAuthenticated();
    }
  }

  void invalidateAuthentication() {
    state = AuthState.notAuthenticated();
  }

  Future<void> _authenticateBackend(String accessToken) async {
    var response = await _dio.post(
      'v1/auth',
      data: AuthRequest(
        authType: AuthType.KAKAO,
        oAuthToken: accessToken,
      ).toJson(),
    );
    final AuthResponse authResponse = AuthResponse.fromJson(response.data);
    await secureStorage.write(
        key: BACKEND_TOKEN_KEY_NAME, value: authResponse.token);
    state = AuthState.authenticated(authResponse.token);
  }
}

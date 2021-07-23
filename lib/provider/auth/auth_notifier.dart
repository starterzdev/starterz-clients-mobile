import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:starterz/provider/auth/auth_state.dart';
import 'package:starterz/provider/auth/domain/auth_request.dart';
import 'package:starterz/provider/auth/domain/auth_response.dart';
import 'package:starterz/provider/auth/domain/integrate_request.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final Dio _dio;

  AuthNotifier(this._dio, AuthState state) : super(state) {
    refreshKakaoToken();
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
    await UserApi.instance.logout();
    state = AuthState.notAuthenticated();
  }

  Future<void> _authenticateBackend(String accessToken) async {
    var response = await _dio.post(
      'auth',
      data: AuthRequest(
        authType: AuthType.KAKAO,
        oAuthToken: accessToken,
      ).toJson(),
    );
    final AuthResponse authResponse = AuthResponse.fromJson(response.data);
    state = AuthState.authenticated(authResponse.token);
  }

  Future<void> integrate(String email) async {
    try {
      state = AuthState.loading();
      final OAuthToken token = await AccessTokenStore.instance.fromStore();
      var response = await _dio.post(
        'auth/integrate',
        data: IntegrateRequest(
          email: email,
          authType: AuthType.KAKAO,
          oAuthToken: token.accessToken!,
        ).toJson(),
      );
      final AuthResponse authResponse = AuthResponse.fromJson(response.data);
      state = AuthState.authenticated(authResponse.token);
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

  void cancelAuthenticating() {
    state = AuthState.notAuthenticated();
  }
}

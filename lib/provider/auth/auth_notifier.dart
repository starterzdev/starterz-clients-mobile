import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:starterz/provider/auth/auth_state.dart';
import 'package:starterz/provider/auth/domain/auth_response.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final Dio _dio;

  AuthNotifier(this._dio, AuthState state) : super(state) {
    refreshKakaoToken();
  }

  Future<void> refreshKakaoToken() async {
    print('Refreshing Kakao token...');
    state = AuthState.loading();

    try {
      final AccessTokenInfo accessTokenInfo =
          await UserApi.instance.accessTokenInfo();
      print("Refreshed Kakao User: ${accessTokenInfo.id}");
      final OAuthToken token = await AccessTokenStore.instance.fromStore();
      var response = await _dio.post('auth', data: {
        "authType": 'KAKAO',
        "token": token.accessToken,
      });
      final AuthResponse authResponse = AuthResponse.fromJson(response.data);
      state = AuthState.authenticated(authResponse.token);
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
      var response = await _dio.post('auth', data: {
        "authType": 'KAKAO',
        "token": token.accessToken,
      });
      final AuthResponse authResponse = AuthResponse.fromJson(response.data);
      state = AuthState.authenticated(authResponse.token);
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
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:starterz/provider/auth/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final Reader read;

  AuthNotifier(this.read, AuthState state) : super(state) {
    refreshKakaoToken();
  }

  Future<void> refreshKakaoToken() async {
    print('Refreshing Kakao token...');
    state = AuthState.loading();

    try {
      final User user = await UserApi.instance.me();
      print("Refreshed Kakao User: $user");
      state = AuthState.authenticated();
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
      state = AuthState.authenticated();
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

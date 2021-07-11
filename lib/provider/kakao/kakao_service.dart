import 'package:kakao_flutter_sdk/all.dart';

class KakaoService {
  KakaoService() {
    KakaoContext.clientId = "73d19306c0fb4b4a496c0377eac5768a";
  }

  void login() async {
    try {
      final isKakaoInstalled = await isKakaoTalkInstalled();
      isKakaoInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();
    } catch (e) {
      print(e);
    }
  }
}

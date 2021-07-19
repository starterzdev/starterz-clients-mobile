import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starterz/provider/providers.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(authProvider).maybeWhen(
            authenticated: (token) {
              SchedulerBinding.instance!.addPostFrameCallback((timeStamp) =>
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('main', (route) => false));
            },
            loading: () => Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Authenticating...'),
                  ],
                ),
              ),
            ),
            orElse: () => Container(
              margin: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 40,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: ref.watch(authProvider.notifier).loginWithKakao,
                    child: Image.asset('assets/images/kakao_login_wide.png'),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}

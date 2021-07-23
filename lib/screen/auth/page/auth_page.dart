import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starterz/provider/providers.dart';
import 'package:starterz/screen/auth/sheet/integration_sheet.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ref.watch(authProvider).maybeWhen(
            authenticated: (token) {
              SchedulerBinding.instance!.addPostFrameCallback((timeStamp) =>
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('main', (route) => false));
            },
            integrationRequired: () {
              SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25.0))),
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return IntegrationSheet();
                  },
                );
              });
              return buildAuthenticationView(ref);
            },
            registrationRequired: () => buildAuthenticationView(ref),
            loading: () => Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator.adaptive(),
                  ],
                ),
              ),
            ),
            orElse: () => buildAuthenticationView(ref),
          ),
    );
  }

  buildAuthenticationView(WidgetRef ref) {
    return Container(
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
            onPressed: ref.read(authProvider.notifier).loginWithKakao,
            child: Image.asset('assets/images/kakao_login_wide.png'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starterz/provider/providers.dart';

class SettingsDashboard extends ConsumerWidget {
  const SettingsDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: ref.read(authProvider.notifier).logoutFromKakao,
            child: Text('logout'),
          )
        ],
      ),
    );
  }
}

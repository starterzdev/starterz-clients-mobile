import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starterz/provider/providers.dart';

class RecruitingDashboard extends ConsumerWidget {
  const RecruitingDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Recruiting'),
            TextButton(
                onPressed: () =>
                    ref.read(backendClientProvider).get('v1/users'),
                child: Text('Fetch Users'))
          ],
        ),
      ),
    );
  }
}

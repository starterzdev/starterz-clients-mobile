import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starterz/provider/providers.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: ref.watch(authProvider).maybeWhen(
            notAuthenticated: () {
              SchedulerBinding.instance!.addPostFrameCallback((timeStamp) =>
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('auth', (route) => false));
            },
            orElse: () => Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: ref.watch(authProvider.notifier).logoutFromKakao,
                    child: Text('Logout'),
                  ),
                ],
              ),
            ),
          ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ref.watch(bottomNavigationProvider).when(
              myProject: () => 0,
              recruiting: () => 1,
              settings: () => 2,
            ),
        onTap: (value) =>
            ref.read(bottomNavigationProvider.notifier).switchTab(value),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.laptop_mac),
            label: '마이프로젝트',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.laptop_mac),
            label: '모집중',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '설정',
          ),
        ],
      ),
    );
  }
}

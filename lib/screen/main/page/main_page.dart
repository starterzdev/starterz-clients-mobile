import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starterz/provider/providers.dart';
import 'package:starterz/screen/my_project/my_project_dashboard.dart';
import 'package:starterz/screen/recruiting/recruiting_dashboard.dart';
import 'package:starterz/screen/settings/settings_dashboard.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: ref.watch(authProvider).maybeWhen(
            loading: () {
              SchedulerBinding.instance!.addPostFrameCallback((timeStamp) =>
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('auth', (route) => false));
            },
            notAuthenticated: () {
              SchedulerBinding.instance!.addPostFrameCallback((timeStamp) =>
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('auth', (route) => false));
            },
            orElse: () => ref.watch(bottomNavigationProvider).when(
                  myProject: () => MyProjectDashboard(),
                  recruiting: () => RecruitingDashboard(),
                  settings: () => SettingsDashboard(),
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

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starterz/provider/bottom_navigation/bottom_navigation_state.dart';

class BottomNavigationNotifier extends StateNotifier<BottomNavigationState> {
  BottomNavigationNotifier(BottomNavigationState state) : super(state) {
    state = BottomNavigationState.myProject();
  }

  void switchTab(int index) {
    switch (index) {
      case 0:
        state = BottomNavigationState.myProject();
        break;
      case 1:
        state = BottomNavigationState.recruiting();
        break;
      case 2:
        state = BottomNavigationState.settings();
        break;
      default:
        throw UnexpectedBottomNavigationException();
    }
  }
}

class UnexpectedBottomNavigationException implements Exception {}

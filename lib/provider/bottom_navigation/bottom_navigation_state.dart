import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_navigation_state.freezed.dart';

@freezed
class BottomNavigationState with _$BottomNavigationState {
  const factory BottomNavigationState.myProject() =
      _BottomNavigationStateMyProject;
  const factory BottomNavigationState.recruiting() =
      _BottomNavigationStateRecruiting;
  const factory BottomNavigationState.settings() =
      _BottomNavigationStateSettings;
}

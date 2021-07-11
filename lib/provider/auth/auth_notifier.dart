import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starterz/provider/auth/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final Reader read;
  AuthNotifier(this.read, AuthState state) : super(state);
}

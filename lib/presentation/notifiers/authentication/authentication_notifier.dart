import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/providers/shared_preferences.dart';
import '../../../core/utils/preferences_key.dart';

part 'authentication_notifier.freezed.dart';
part 'authentication_state.dart';

final authenticationNotifier =
    StateNotifierProvider<AuthenticationNotifier, AuthenticationState>(
  (ref) {
    final preferences = ref.watch(sharedPreferences);

    return AuthenticationNotifier(preferences);
  },
);

class AuthenticationNotifier extends StateNotifier<AuthenticationState> {
  final SharedPreferences _preferences;

  AuthenticationNotifier(this._preferences)
      : super(const AuthenticationState.unauthenticated());

  void checkStatus() {
    if (_preferences.containsKey(PreferencesKey.tokenKey)) {
      state = const AuthenticationState.authenticated();
    } else {
      state = const AuthenticationState.unauthenticated();
    }
  }

  Future<void> logout() async {
    try {
      _preferences.remove(PreferencesKey.tokenKey);
      checkStatus();
    } catch (e) {
      logout();
    }
  }
}

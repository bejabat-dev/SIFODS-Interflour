import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/models/user.dart';

class UserState {
  final User? user;
  final bool isLoading;
  final String? error;

  UserState({
    this.user,
    this.isLoading = false,
    this.error,
  });

  factory UserState.loading() {
    return UserState(
      isLoading: true,
    );
  }

  factory UserState.success(User user) {
    return UserState(
      user: user,
      isLoading: false,
    );
  }

  factory UserState.error() {
    return UserState(
      isLoading: false,
      error: 'Gagal memuat data',
    );
  }
}

final userProvider = StateProvider<UserState>((ref) {
  return UserState();
});
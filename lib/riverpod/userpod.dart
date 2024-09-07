import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/models/user.dart';

enum UserStates { loading, loaded, error }

class UserStateData {
  final UserStates state;
  final dynamic data;

  UserStateData({required this.state, required this.data});

  UserStateData copyWith({UserStates? state, User? data}) {
    return UserStateData(
        state: state ?? this.state, data: data ?? this.data);
  }
}

class MessagesStateNotifier extends StateNotifier<UserStateData> {
  MessagesStateNotifier()
      : super(UserStateData(
            state: UserStates.loaded, data: 'No data'));

  void getUserData() async {

  }
}

final userProvider =
    StateNotifierProvider<MessagesStateNotifier, UserStateData>((ref) {
  return MessagesStateNotifier();
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/models/user.dart';
import 'package:flutter/material.dart';

enum UserStates { loading, error, loaded }

class UserPod {
  final User? data;
  final UserStates state;

  UserPod({this.data, required this.state});
}

class UserNotifier extends StateNotifier<UserPod> {
  UserNotifier() : super(UserPod(state: UserStates.loading));
  void load() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      state = UserPod(
          data: User(email: 'noob@gmail.com'), state: UserStates.loaded);
    } on Exception catch (e) {
      debugPrint(e.toString());
      state = UserPod(state: UserStates.error);
    }
  }
}

final userProvider =
    StateNotifierProvider<UserNotifier, UserPod>((ref) => UserNotifier());

class Example extends ConsumerWidget {
  const Example({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPod = ref.watch(userProvider);
    ref.read(userProvider.notifier).load();
    return Scaffold(
      body: userPod.state == UserStates.loaded ? Text('data') : Text('data'),
    );
  }
}

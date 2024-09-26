import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/models/user.dart';

class Userpod {
  final bool? loading;
  final User? user;
  Userpod({this.loading, this.user});
}

final userPod = StateProvider((ref) {
  return Userpod(loading: true);
});
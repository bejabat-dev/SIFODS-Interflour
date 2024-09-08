import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/models/user.dart';
import 'package:sifods_interflour/pages/dashboard.dart';
import 'package:sifods_interflour/riverpod/userpod.dart';
import 'package:sifods_interflour/utils/tools.dart';

class Networking {
  final tools = Tools();
  final dio = Dio();
  final baseUrl = 'http://192.168.1.6:3000/sifods';

  Future<void> register(BuildContext context, User user, WidgetRef ref) async {
    final userpod = ref.read(userProvider.notifier);
    tools.showLoadingDialog(context, 'Registering account');
    try {
      final res = await dio.post('$baseUrl/register', data: user.toJson());
      if (res.statusCode == 201) {
        if (context.mounted) {
          debugPrint(res.data.toString());
          userpod.state = UserState.success(User.fromJson(res.data));
          Navigator.pop(context);
          Tools().NavigateAndClear(context, const Dashboard());
        }
      }
    } catch (e) {
      if (context.mounted) {
        debugPrint(e.toString());
        Navigator.pop(context);
        if (e.toString().contains('400')) {
          Tools().showErrorDialog(context, 'Email sudan digunakan');
        }
      }
    }
  }

  Future<void> login(BuildContext context, User user, WidgetRef ref) async {
    final userpod = ref.read(userProvider.notifier);
    try {
      tools.showLoadingDialog(context, 'Logging in');
      final res = await dio.get('$baseUrl/login', data: user.toJson());
      if (res.statusCode == 201) {
        if (context.mounted) {
          debugPrint(res.data.toString());
          userpod.state = UserState.success(User.fromJson(res.data));
          Tools().NavigateAndClear(context, const Dashboard());
        }
      }
    } catch (e) {
      if (context.mounted) {
        debugPrint(e.toString());
        Navigator.pop(context);
        if (e.toString().contains('400')) {
          Tools().showErrorDialog(context, 'Email tidak ditemukan');
        }
      }
    }
  }
}

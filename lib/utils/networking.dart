import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sifods_interflour/models/user.dart';
import 'package:sifods_interflour/pages/dashboard.dart';
import 'package:sifods_interflour/networking/riverpod/userpod.dart';
import 'package:sifods_interflour/utils/helper.dart';
import 'package:sifods_interflour/utils/tools.dart';

const baseUrl = 'http://192.168.1.6:3000/sifods';

class Networking {
  final tools = Tools();
  final dio = Dio();

  Future<void> register(BuildContext context, User user, WidgetRef ref) async {
    final userNotifier = ref.read(userPod.notifier);
    tools.showLoadingDialog(context, 'Registering account');
    try {
      final res = await dio.post('$baseUrl/register', data: user.toJson());
      if (res.statusCode == 201) {
        if (context.mounted) {
          debugPrint(res.data.toString());
          saveUser(res.data['id'], user.email, user.password!);
          userNotifier.state = Userpod(user: User.fromJson(res.data));
          Helper.user = User.fromJson(res.data);
          Navigator.pop(context);
          Tools().NavigateAndClear(context, const Dashboard());
        }
      }
    } catch (e) {
      if (context.mounted) {
        debugPrint(e.toString());
        Navigator.pop(context);
        if (e.toString().contains('400')) {
          Tools().showErrorDialog(context, 'Email sudah digunakan');
        }
      }
    }
  }

  Future<void> login(BuildContext context, User user, WidgetRef ref) async {
    final userNotifier = ref.read(userPod.notifier);
    try {
      tools.showLoadingDialog(context, 'Logging in');
      final res = await dio.get('$baseUrl/login', data: user.toJson());
      if (res.statusCode == 201) {
        if (context.mounted) {
          debugPrint(res.data.toString());
          userNotifier.state = Userpod(user: User.fromJson(res.data));
          Helper.user = User.fromJson(res.data);
          saveUser(res.data['id'], user.email, user.password!);
          Tools().NavigateAndClear(context, const Dashboard());
        }
      }
    } catch (e) {
      if (context.mounted) {
        debugPrint(e.toString());
        Navigator.pop(context);
        if (e.toString().contains('400')) {
          Tools().showErrorDialog(context, 'Email tidak ditemukan');
        } else {
          Tools().showErrorDialog(context, 'Kesalahan jaringan');
        }
      }
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('loggedin', false);
    }
  }

  void saveUser(int id, String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('loggedin', true);
    prefs.setString('email', email);
    prefs.setString('password', password);
    prefs.setInt('id', id);
  }
}

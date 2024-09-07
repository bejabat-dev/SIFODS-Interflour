import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sifods_interflour/models/user.dart';
import 'package:sifods_interflour/utils/tools.dart';

class Networking {
  final tools = Tools();
  final dio = Dio();
  final baseUrl = 'http://192.168.1.6:3000/sifods';

  Future<void> register(BuildContext context, User user) async {
    tools.showLoadingDialog(context, 'Registering account');
    try {
      final res = await dio.post('$baseUrl/register', data: user.toMap());
      if (res.statusCode == 201) {
        if (context.mounted) {
          Navigator.pop(context);
        }
        debugPrint(res.data);
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
      }
      debugPrint(e.toString());
    }
  }

  Future<void> login(BuildContext context, User user) async {
    tools.showLoadingDialog(context, 'Logging in');
    try {
      final res = await dio.get('$baseUrl/login', data: user.toMap());
      if (res.statusCode == 201) {
        if (context.mounted) {
          Navigator.pop(context);
        }
        debugPrint(res.data);
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
      }
      debugPrint(e.toString());
    }
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sifods_interflour/models/user.dart';
import 'package:sifods_interflour/utils/tools.dart';

class Networking {
  final tools = Tools();
  final dio = Dio();
  final baseUrl = 'http://192.168.1.6:3000/sifods';

  Future<void> register(BuildContext context,User user) async {
    try {
      tools.showLoadingDialog(context, 'text');
      final res = await dio.post('$baseUrl/register', data: user.toMap());
    } on Exception {}
  }
}

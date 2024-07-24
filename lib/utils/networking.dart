import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sifods_interflour/auth/forgot.dart';
import 'package:sifods_interflour/pages/dashboard.dart';

class Networking {
  final baseUrl = 'http://localhost:3000/api';
  final dio = Dio();

  Map<String, dynamic> userData(
      String? nama, String email, String password, String? jabatan) {
    Map<String, dynamic> map = {
      'nama': nama,
      'email': email,
      'password': password,
      'jabatan': jabatan,
    };
    return map;
  }

  void login() async {}

  void register(BuildContext context, Map<String, dynamic> data) async {
    utils.showLoadingDialog(context, 'Mendaftarkan akun');
    try {
      final res = await dio.post('$baseUrl/register', data: data);
      debugPrint(res.statusCode.toString());
      if (context.mounted) {
        if (res.statusCode == 201) {
          utils.NavigateAndClear(context, const Dashboard());
        } else if (res.statusCode == 400) {
          utils.showErrorDialog(context, res.statusMessage!);
        }
      }
    } catch (e) {
      if (context.mounted) {
        if (e.toString().contains('400')) {
          Navigator.pop(context);
          utils.showErrorDialog(context, 'Email sudah digunakan');
        }
      }
    }
  }
}

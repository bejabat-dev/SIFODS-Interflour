import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sifods_interflour/pages/dashboard.dart';
import 'package:sifods_interflour/utils/tools.dart';
import 'package:sifods_interflour/utils/userdata.dart';

class Networking {

final utils = Tools();
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

  void login(BuildContext context, Map<String, dynamic> data) async {
    utils.showLoadingDialog(context, 'Sedang masuk');
    String email = data['email'];
    try {
      final res = await dio.get('$baseUrl/login', data: data);
      debugPrint(res.statusCode.toString());
      if (context.mounted) {
        if (res.statusCode == 201) {
          Userdata.userPrefs!.setString('email', email);
          getUserData(context, email);
        }
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        if (e.toString().contains('400')) {
          debugPrint(e.toString());
          utils.showErrorDialog(context, 'Email tidak ditemukan');
        }
        if (e.toString().contains('401')) {
          debugPrint(e.toString());
          utils.showErrorDialog(context, 'Kata sandi salah');
        }
      }
    }
  }

  void register(BuildContext context, Map<String, dynamic> data) async {
    utils.showLoadingDialog(context, 'Mendaftarkan akun');
    String email = data['email'];
    try {
      final res = await dio.post('$baseUrl/register', data: data);
      debugPrint(res.statusCode.toString());
      if (context.mounted) {
        if (res.statusCode == 201) {
          Userdata.userPrefs!.setString('email', email);

          getUserData(context, email);
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

  void getUserData(BuildContext context, String email) async {
    try {
      final res = await dio.get('$baseUrl/user', data: {'email': email});
      if (res.statusCode == 201) {
        Userdata.data = res.data;

        Userdata.userPrefs!.setBool('loggedin', true);
        if (context.mounted) {
          utils.NavigateAndClear(context, Dashboard());
        }
      }
    } catch (e) {
      if (e.toString().contains('400')) {
        if (context.mounted) {
          Navigator.pop(context);
          debugPrint(e.toString());
          utils.showErrorDialog(context, 'Email tidak ditemukan');
        }
      }
    }
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sifods_interflour/pages/dashboard.dart';
import 'package:sifods_interflour/utils/tools.dart';
import 'package:sifods_interflour/utils/userdata.dart';

class Networking {
  final utils = Tools();
  final baseUrl = 'http://192.168.1.2:3000/api';
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

  Future<void> login(BuildContext context, Map<String, dynamic> data) async {
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

  Future<void> register(BuildContext context, Map<String, dynamic> data) async {
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

  Future<void> getUserData(BuildContext context, String email) async {
    try {
      final res = await dio.get('$baseUrl/user', data: {'email': email});
      if (res.statusCode == 201) {
        Userdata.data = res.data;

        Userdata.userPrefs!.setBool('loggedin', true);
        if (context.mounted) {
          utils.NavigateAndClear(context, const Dashboard());
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

  Future<void> uploadTruck(BuildContext context, Map<String, dynamic> data,
      Map<String, dynamic> logData) async {
    utils.showLoadingDialog(context, 'Menyimpan data kendaraan');
    try {
      final res = await dio.post('$baseUrl/add_truck', data: data);
      if (res.statusCode == 201) {
        addLog(logData);
        if (context.mounted) {
          Navigator.pop(context);
          utils.showConfirmDialog(context, 'Berhasil menambahkan kendaraan');
        }
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        utils.showErrorDialog(
            context, 'Terjadi kesalahan, periksa internet anda.');
      }
    }
  }

  Future<void> uploadContainer(
      BuildContext context, Map<String, dynamic> data) async {
    utils.showLoadingDialog(context, 'Menyimpan data container');
    try {
      final res = await dio.post('$baseUrl/add_container', data: data);
      if (res.statusCode == 201) {
        if (context.mounted) {
          Navigator.pop(context);
          utils.showConfirmDialog(context, 'Berhasil menambahkan container');
        }
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        utils.showErrorDialog(
            context, 'Terjadi kesalahan, periksa internet anda.');
      }
    }
  }

  Future<void> uploadProduct(
      BuildContext context, Map<String, dynamic> data) async {
    utils.showLoadingDialog(context, 'Menyimpan data product');
    try {
      final res = await dio.post('$baseUrl/add_product', data: data);
      if (res.statusCode == 201) {
        if (context.mounted) {
          Navigator.pop(context);
          utils.showConfirmDialog(context, 'Berhasil menambahkan product');
        }
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        utils.showErrorDialog(
            context, 'Terjadi kesalahan, periksa internet anda.');
      }
    }
  }

  Future<dynamic> getNopols() async {
    try {
      final res = await dio
          .get('$baseUrl/nopol', data: {'id_user': Userdata.data!['id']});
      if (res.statusCode == 201) {
        debugPrint(res.data.toString());
        return res.data;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<dynamic> getContainer() async {
    try {
      final res = await dio
          .get('$baseUrl/container', data: {'id_user': Userdata.data!['id']});
      if (res.statusCode == 201) {
        debugPrint(res.data.toString());
        return res.data;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<void> addLog(Map<String, dynamic> data) async {
    try {
      final res = await dio.post('$baseUrl/log', data: data);
      if (res.statusCode == 201) {
        debugPrint('Log added');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<dynamic> getLogs() async {
    try {
      final res = await dio
          .get('$baseUrl/logs', data: {'id_user': Userdata.data!['id']});
      if (res.statusCode == 201) {
        debugPrint('Log added');
        return res.data;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<void> addChecklistTruck(BuildContext context,Map<String,dynamic> data,Map<String,dynamic> logData) async {
    try {
      final res = await dio.post('$baseUrl/checklist/truck',
          data: data);
      if (res.statusCode == 201) {
        addLog(data);
        if (context.mounted) {
          utils.showConfirmDialog(context, 'Berhasil menambahkan checklist');
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

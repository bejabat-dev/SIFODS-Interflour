import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sifods_interflour/auth/register.dart';
import 'package:sifods_interflour/models/model_truck.dart';
import 'package:sifods_interflour/utils/networking.dart';

class Vehicles {
  final dio = Dio();

  Future<SharedPreferences> getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  Future<List<dynamic>> getNopol(WidgetRef ref) async {
    var prefs = await getPrefs();

    final res =
        await dio.get('$baseUrl/nopol', data: {'id_user': prefs.getInt('id')});
    debugPrint(res.data.toString());
    return res.data;
  }

  Future<void> saveChecklistTruck(
      BuildContext context, ModelTruck model) async {
    utils.showLoadingDialog(context, 'Saving data');
    try {
      final res =
          await dio.post('$baseUrl/checklist/truck', data: model.toMap());
      if (res.statusCode == 201) {
        if (context.mounted) {
          Navigator.pop(context);
          Navigator.pop(context);
        }
      }
    } on Exception catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        utils.showErrorDialog(context, e.toString());
      }
    }
  }
}

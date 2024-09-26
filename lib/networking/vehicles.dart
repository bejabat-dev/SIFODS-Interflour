import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sifods_interflour/auth/register.dart';
import 'package:sifods_interflour/models/add_container.dart';
import 'package:sifods_interflour/models/add_truck.dart';
import 'package:sifods_interflour/models/log_model.dart';
import 'package:sifods_interflour/models/model_container.dart';
import 'package:sifods_interflour/models/model_update.dart';
import 'package:sifods_interflour/models/model_vehicle.dart';
import 'package:sifods_interflour/networking/riverpod/vehiclespod.dart';
import 'package:sifods_interflour/utils/helper.dart';
import 'package:sifods_interflour/utils/networking.dart';

class Vehicles {
  final dio = Dio();

  Future<void> addLog(WidgetRef ref, LogModel data) async {
    try {
      final res = await dio.post("$baseUrl/logs", data: data.toJson());
      debugPrint(data.toJson().toString());
      if (res.statusCode == 201) {
        ref.refresh(getLogsProvider);
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<SharedPreferences> getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  Future<List<dynamic>> getNopol() async {
    var prefs = await getPrefs();

    final res =
        await dio.get('$baseUrl/nopol', data: {'id_user': prefs.getInt('id')});
    debugPrint(res.data.toString());
    return res.data;
  }

  Future<List<dynamic>> getContainerToUpdate() async {
    var prefs = await getPrefs();

    final res = await dio.get('$baseUrl/update_container',
        data: {'id_user': prefs.getInt('id')});
    debugPrint(res.data.toString());
    return res.data;
  }

  Future<List<dynamic>> getContainer() async {
    var prefs = await getPrefs();

    final res = await dio
        .get('$baseUrl/container', data: {'id_user': prefs.getInt('id')});
    debugPrint(res.data.toString());
    return res.data;
  }

  Future<void> addContainer(
      BuildContext context, AddContainer data, WidgetRef ref) async {
    utils.showLoadingDialog(context, 'Saving data');
    try {
      final res = await dio.post('$baseUrl/add_container', data: data.toJson());
      if (res.statusCode == 201) {
        var logData = LogModel(
            id_user: Helper.user.id!,
            type: 'container',
            type_id: res.data,
            value: data.nomor,
            tanggal: null);
        await addLog(ref, logData);
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

  Future<void> addTruck(
      BuildContext context, AddTruck data, WidgetRef ref) async {
    utils.showLoadingDialog(context, 'Saving data');
    try {
      final res = await dio.post('$baseUrl/add_truck', data: data.toJson());
      if (res.statusCode == 201) {
        var logData = LogModel(
            id_user: Helper.user.id!,
            type: 'vehicle',
            type_id: res.data,
            value: data.nopol,
            tanggal: null);
        await addLog(ref, logData);
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

  Future<void> saveChecklistTruck(
      BuildContext context, ModelVehicle model, WidgetRef ref) async {
    utils.showLoadingDialog(context, 'Saving data');
    try {
      final res =
          await dio.post('$baseUrl/checklist/truck', data: model.toJson());
      debugPrint(res.data.toString());
      if (res.statusCode == 201) {
        var data = LogModel(
            id_user: Helper.user.id!,
            type: 'checklist_truck',
            type_id: res.data,
            value: model.nopol!,
            tanggal: null);
        await addLog(ref, data);
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

  Future<void> saveChecklistContainer(
      BuildContext context, ModelContainer data, WidgetRef ref) async {
    utils.showLoadingDialog(context, 'Saving data');
    try {
      final res =
          await dio.post('$baseUrl/checklist/container', data: data.toJson());
      if (res.statusCode == 201) {
        var data2 = LogModel(
            id_user: Helper.user.id!,
            type: 'checklist_container',
            type_id: res.data,
            value: data.nomor,
            tanggal: null);
        await addLog(ref, data2);
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

   Future<void> saveChecklistUpdate(
      BuildContext context, ModelUpdate data, WidgetRef ref) async {
    utils.showLoadingDialog(context, 'Saving data');
    try {
      final res =
          await dio.post('$baseUrl/checklist/update', data: data.toJson());
      if (res.statusCode == 201) {
        var data2 = LogModel(
            id_user: Helper.user.id!,
            type: 'update_container',
            type_id: res.data,
            value: data.nomor!,
            tanggal: null);
        await addLog(ref, data2);
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

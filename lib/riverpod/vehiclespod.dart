import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sifods_interflour/models/add_container.dart';
import 'package:sifods_interflour/models/add_vehicle.dart';
import 'package:sifods_interflour/models/log_model.dart';
import 'package:sifods_interflour/utils/helper.dart';
import 'package:sifods_interflour/utils/networking.dart';

part 'vehiclespod.g.dart';

final dio = Dio();

@riverpod
Future<List<LogModel>> getLogs(GetLogsRef ref) async {
  try {
    debugPrint('START');
    final res =
        await dio.get('$baseUrl/logs', data: {'id_user': Helper.user.id});
    debugPrint('Response data: ${res.data}');

    List<dynamic> data = res.data;
    List<LogModel> trucks =
        data.map((truck) => LogModel.fromJson(truck)).toList();
    debugPrint('Trucks parsed: ${trucks.length}');

    return trucks;
  } catch (e) {
    debugPrint('Error fetching vehicle logs: $e');
    throw Exception('Failed to fetch vehicle logs: $e');
  }
}

@riverpod
Future<AddTruck> getTruck(GetTruckRef ref, int id) async {
  try {
    debugPrint('START');
    final res = await dio.get('$baseUrl/detail/truck', data: {'id': id});
    debugPrint('Response data: ${res.data}');
    AddTruck trucks = AddTruck.fromJson(res.data);
    return trucks;
  } catch (e) {
    debugPrint('Error fetching vehicle logs: $e');
    throw Exception('Failed to fetch vehicle logs: $e');
  }
}

@riverpod
Future<AddContainer> getContainer(GetContainerRef ref, int id) async {
  try {
    debugPrint('START');
    final res = await dio.get('$baseUrl/detail/container', data: {'id': id});
    debugPrint('Response data: ${res.data}');
    AddContainer containers = AddContainer.fromMap(res.data);
    return containers;
  } catch (e) {
    debugPrint('Error fetching vehicle logs: $e');
    throw Exception('Failed to fetch vehicle logs: $e');
  }
}

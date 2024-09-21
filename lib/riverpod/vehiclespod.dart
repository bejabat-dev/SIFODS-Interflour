import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:sifods_interflour/models/add_vehicle.dart';
import 'package:sifods_interflour/utils/helper.dart';
import 'package:sifods_interflour/utils/networking.dart';

part 'vehiclespod.g.dart';

final dio = Dio();

class VehiclesPod {
  final List<AddTruck>? addTruck;
  final bool? error;
  final bool? loading;
  final String? message;
  VehiclesPod({this.message, this.addTruck, this.error, this.loading});
}

@riverpod
Future<List<AddTruck>> getVehicleLogs(GetVehicleLogsRef ref) async {
  try {
    debugPrint('START');
    final res = await dio
        .get('$baseUrl/logs/vehicles', data: {'id_user': Helper.user.id});
    debugPrint('Response data: ${res.data}');

    List<dynamic> data = res.data;
    List<AddTruck> trucks =
        data.map((truck) => AddTruck.fromJson(truck)).toList();
    debugPrint('Trucks parsed: ${trucks.length}');

    return trucks;
  } catch (e) {
    debugPrint('Error fetching vehicle logs: $e');
    throw Exception('Failed to fetch vehicle logs: $e');
  }
}


/*try {
      final res =
          await dio.get('$baseUrl/logs/vehicles', data: {'id_user': Helper.user});
      debugPrint(res.toString());
      if (res.statusCode == 201) {
        List<dynamic> data = res.data;
        List<AddTruck> trucks =
            data.map((truck) => AddTruck.fromJson(truck)).toList();
        vehiclesPod.state = VehiclesPod(addTruck: trucks);
      }
    } on Exception catch (e) {
      vehiclesPod.state = VehiclesPod(error: true, message: e.toString());
    }*/
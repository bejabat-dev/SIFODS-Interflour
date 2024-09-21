import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/models/add_vehicle.dart';
import 'package:sifods_interflour/utils/networking.dart';

final dio = Dio();

class VehiclesPod {
  final List<AddTruck>? addTruck;
  final bool? error;
  final bool? loading;
  final String? message;
  VehiclesPod({this.message, this.addTruck, this.error, this.loading});

  void getLogs(int id, WidgetRef ref) async {
    final vehiclesProvider = ref.read(vehiclesPod.notifier);
    vehiclesProvider.state = VehiclesPod(loading: true);
    try {
      final res =
          await dio.get('$baseUrl/logs/vehicles', data: {'id_user': id});
      debugPrint(res.toString());
      if (res.statusCode == 201) {
        List<dynamic> data = res.data;
        List<AddTruck> trucks =
            data.map((truck) => AddTruck.fromJson(truck)).toList();
        vehiclesProvider.state = VehiclesPod(addTruck: trucks);
      }
    } on Exception catch (e) {
      vehiclesProvider.state = VehiclesPod(error: true, message: e.toString());
    }
  }
}

final vehiclesPod = StateProvider((ref) {
  return VehiclesPod(loading: true);
});

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/models/add_vehicle.dart';
import 'package:sifods_interflour/riverpod/vehiclespod.dart';

class LogVehicles extends ConsumerWidget {
  const LogVehicles({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<dynamic>> trucks = ref.watch(getVehicleLogsProvider);

    return Scaffold(
        body: switch (trucks) {
      AsyncValue<List<AddTruck>>(:final valueOrNull?) => ListView.builder(
          itemCount: valueOrNull.length,
          itemBuilder: (context, i) {
            var data = valueOrNull[i];
            return Text(data.nama!);
          }),
      AsyncValue(:final error?) => Text('Error: $error'),
      _ => const CircularProgressIndicator(),
    });
  }
}

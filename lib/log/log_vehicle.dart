import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/auth/register.dart';
import 'package:sifods_interflour/models/add_truck.dart';
import 'package:sifods_interflour/networking/riverpod/vehiclespod.dart';

class LogVehicle extends ConsumerWidget {
  const LogVehicle({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AddTruck> data = ref.watch(getTruckProvider(id));
    return Scaffold(
      appBar: styles.customAppBar(context, 'Vehicle detail'),
      body: data.when(data: (value) {
        return Text(value.nama);
      }, error: (e, s) {
        return const Center(
          child: Text('Error'),
        );
      }, loading: () {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }),
    );
  }
}

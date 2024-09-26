import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/auth/register.dart';
import 'package:sifods_interflour/models/model_vehicle.dart';
import 'package:sifods_interflour/networking/riverpod/vehiclespod.dart';

class LogChecklistVehicle extends ConsumerWidget {
  const LogChecklistVehicle({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ModelVehicle> data =
        ref.watch(getVehicleChecklistProvider(id));
    return Scaffold(
      appBar: styles.customAppBar(context, 'Checklist truck'),
      body: data.when(data: (value) {
        return Text(value.id_user.toString());
      }, error: (e, s) {
        return const Text('Error');
      }, loading: () {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }),
    );
  }
}

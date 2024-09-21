import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/riverpod/vehiclespod.dart';

class LogVehicles extends ConsumerWidget {
  const LogVehicles({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehiclesProvider = ref.watch(vehiclesPod);
    return vehiclesProvider.addTruck != null
        ? ListView.builder(
            itemCount: vehiclesProvider.addTruck!.length,
            itemBuilder: (context, i) {
              var data = vehiclesProvider.addTruck![i];
              return Text(data.nama!);
            },
          )
        : vehiclesProvider.error != null
            ? const Center(
                child: Text('Error fetching logs'),
              )
            : const Center(child: CupertinoActivityIndicator());
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/models/log_model.dart';
import 'package:sifods_interflour/riverpod/vehiclespod.dart';

class LogVehicles extends ConsumerWidget {
  const LogVehicles({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<LogModel>> logs = ref.watch(getLogsProvider);
    return Scaffold(
        body: logs.when(data: (list) {
      if (list.isEmpty) {
        return const Center(child: Text('No data'));
      }
      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, i) {
            var data = list[i];
            return Text(data.tanggal);
          });
    }, error: (e, s) {
      return const Center(
        child: Text('Error fetching data'),
      );
    }, loading: () {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }));
  }
}

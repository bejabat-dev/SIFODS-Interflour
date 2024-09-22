import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/models/log_model.dart';
import 'package:sifods_interflour/pages/log_details.dart';
import 'package:sifods_interflour/riverpod/vehiclespod.dart';
import 'package:sifods_interflour/utils/tools.dart';

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
            return Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: Material(
                color: Colors.white,
                elevation: 1,
                child: InkWell(
                  onTap: () {
                    if (data.type == 'vehicle') {
                      Tools().Navigate(context, TruckDetails(id: data.type_id));
                    }
                    if (data.type == 'container') {
                      Tools().Navigate(
                          context, ContainerDetails(id: data.type_id));
                    }
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(child: Text('Added ${data.type}')),
                            Text(Tools().formatDate(data.tanggal)),
                          ],
                        ),
                        Text(data.value)
                      ],
                    ),
                  ),
                ),
              ),
            );
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

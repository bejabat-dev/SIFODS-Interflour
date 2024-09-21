import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/models/add_vehicle.dart';
import 'package:sifods_interflour/pages/log_details.dart';
import 'package:sifods_interflour/riverpod/vehiclespod.dart';
import 'package:sifods_interflour/utils/tools.dart';

class LogVehicles extends ConsumerWidget {
  const LogVehicles({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<dynamic>> trucks = ref.watch(getVehicleLogsProvider);

    return Scaffold(
      body: switch (trucks) {
        
        AsyncValue(:final error?) => Text('Error: $error'),
        AsyncValue<List<AddTruck>>(:final valueOrNull?) => 
            ListView.builder(
                itemCount: valueOrNull.length,
                itemBuilder: (context, i) {
                  var data = valueOrNull[i];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: Material(
                      elevation: 1,
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          Tools().Navigate(context, LogDetails(addTruck: data));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    data.nama!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )),
                                  Text(Tools()
                                      .formatDate(data.created.toString()))
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(child: Text(data.nopol!)),
                                  Text(data.status!)
                                ],
                              ),
                              Text(data.jenis!)
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                })
           ,
        _ => const Center(
            child: CupertinoActivityIndicator(),
          ),
          
      },
      floatingActionButton: FloatingActionButton(onPressed: () {
        ref.refresh(getVehicleLogsProvider);
      }),
    );
  }
}

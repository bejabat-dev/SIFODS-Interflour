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
      appBar: data.when(data: (value) {
        return styles.customAppBar(context, value.nopol);
      }, error: (e, s) {
        return styles.customAppBar(context, 'Error');
      }, loading: () {
        return styles.customAppBar(context, 'Loading');
      }),
      body: data.when(data: (value) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  styles.mediumText('Nama Kendaraan'),
                  styles.mediumText('No. Polisi'),
                  styles.mediumText('Ekspedisi'),
                  styles.mediumText('Nama Supir'),
                  styles.mediumText('Jenis Kendaraan'),
                  styles.mediumText('No. Handphone'),
                  styles.mediumText('Volume Muatan'),
                  styles.mediumText('Jumlah Kendaraan')
                ],
              ),
              Column(
                children: [
                  styles.mediumText(' : '),
                  styles.mediumText(' : '),
                  styles.mediumText(' : '),
                  styles.mediumText(' : '),
                  styles.mediumText(' : '),
                  styles.mediumText(' : '),
                  styles.mediumText(' : '),
                  styles.mediumText(' : '),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  styles.mediumText(value.nama),
                  styles.mediumText(value.nopol),
                  styles.mediumText(value.ekspedisi),
                  styles.mediumText(value.supir),
                  styles.mediumText(value.jenis),
                  styles.mediumText(value.telp),
                  styles.mediumText(value.volume),
                  styles.mediumText(value.jumlah.toString()),
                ],
              )
            ],
          ),
        );
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

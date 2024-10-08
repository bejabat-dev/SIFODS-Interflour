import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/auth/register.dart';
import 'package:sifods_interflour/models/model_vehicle.dart';
import 'package:sifods_interflour/networking/riverpod/vehiclespod.dart';

class LogChecklistVehicle extends ConsumerWidget {
  LogChecklistVehicle({super.key, required this.id});
  final int id;

  final List<String> checks = [
    'Bebas dari Sampah/Kotoran/Sisa produk lain',
    'Lantai bersih & kering (tidak basah,lembab/berminyak)',
    'Tidak ada Jamur/Lumut/Sarang Laba2/ Serangga hidup/mati',
    'Tidak ada noda/ceceran yang dapat berpindah ke produk & mengkontaminasi (transfable)',
    'Tidak ada Residu (sisa) dari muatan sebelumnya',
    'Permukaan lantai/alas mulus dan tidak pecah (terutama lantai kayu), jika perlu menggunakan alas/terpal',
    'Ban dan baut pengikat roda dalam kondisi baik',
    'Tidak ada kebocoran pelumas dan bahan bakar',
    'Bebas dari bau menyengat/tajam/kotoran/apek'
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ModelVehicle> data =
        ref.watch(getVehicleChecklistProvider(id));
    return Scaffold(
      appBar: styles.customAppBar(context, 'Checklist truck'),
      body: data.when(data: (value) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: checks.length,
            itemBuilder: (context, i) {
              return Row(
                children: [
                  Expanded(child: Text(checks[i])),
                  Checkbox(value: value.box0, onChanged: ((e) {}))
                ],
              );
            },
          ),
        );
      }, error: (e, s) {
        return const Center(child: Text('An error occured'));
      }, loading: () {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }),
    );
  }
}

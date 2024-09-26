import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/auth/register.dart';
import 'package:sifods_interflour/models/add_container.dart';
import 'package:sifods_interflour/networking/riverpod/vehiclespod.dart';

class LogContainer extends ConsumerWidget {
  const LogContainer({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AddContainer> data = ref.watch(getContainerProvider(id));
    return Scaffold(
      appBar: data.when(data: (value) {
        return styles.customAppBar(context, value.nomor);
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
                  styles.mediumText('Nama Container'),
                  styles.mediumText('No. Container'),
                  styles.mediumText('No. Seal'),
                ],
              ),
              Column(
                children: [
                  styles.mediumText(' : '),
                  styles.mediumText(' : '),
                  styles.mediumText(' : '),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  styles.mediumText(value.nama),
                  styles.mediumText(value.nomor),
                  styles.mediumText(value.seal),
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

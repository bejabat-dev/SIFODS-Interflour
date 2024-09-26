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
      appBar: styles.customAppBar(context, 'Container details'),
      body: data.when(data: (value) {
        return Text(value.nama);
      }, error: (e, s) {
        return Text(s.toString());
      }, loading: () {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }),
    );
  }
}

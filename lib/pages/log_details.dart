import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/auth/forgot.dart';
import 'package:sifods_interflour/models/add_container.dart';
import 'package:sifods_interflour/models/add_truck.dart';
import 'package:sifods_interflour/riverpod/vehiclespod.dart';

class TruckDetails extends ConsumerWidget {
  const TruckDetails({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final AsyncValue<AddTruck> truck = ref.watch(getTruckProvider(id));
    return Scaffold(
      appBar: styles.customAppBar(context, 'Details'),
      body: truck.when(data: (data) {
        return Text(data.nama!);
      }, error: (e, s) {
        return Text(e.toString());
      }, loading: () {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }),
    );
  }
}

class ContainerDetails extends ConsumerWidget {
  const ContainerDetails({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final AsyncValue<AddContainer> truck = ref.watch(getContainerProvider(id));
    return Scaffold(
      appBar: styles.customAppBar(context, 'Details'),
      body: truck.when(data: (data) {
        return Text(data.nama);
      }, error: (e, s) {
        return Text(e.toString());
      }, loading: () {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }),
    );
  }
}

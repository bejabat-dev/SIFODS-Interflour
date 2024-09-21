import 'package:flutter/material.dart';
import 'package:sifods_interflour/models/add_vehicle.dart';
import 'package:sifods_interflour/utils/styles.dart';

class LogDetails extends StatelessWidget {
  const LogDetails({super.key, required this.addTruck});
  final AddTruck addTruck;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Styles().customAppBar(context, 'Details'),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(addTruck.nama!),
          Text(addTruck.nopol!),
          Text(addTruck.supir!),
          Text(addTruck.status!),
          Text(addTruck.telp!),
          Text(addTruck.jumlah!.toString()),
          Text(addTruck.volume!),
          Text(addTruck.jenis!),
          Text(addTruck.ekspedisi!)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.print),
      ),
    );
  }
}

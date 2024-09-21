import 'package:flutter/material.dart';
import 'package:sifods_interflour/models/add_vehicle.dart';
import 'package:sifods_interflour/utils/styles.dart';

class LogDetails extends StatelessWidget {
  const LogDetails({super.key, required this.addTruck});
  final AddTruck addTruck;

  final TextStyle ts = const TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Styles().customAppBar(context, 'Details'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: ts,
                  ),
                  Text(
                    'Licence plate number',
                    style: ts,
                  ),
                  Text(
                    'Driver',
                    style: ts,
                  ),
                  Text(
                    'Status',
                    style: ts,
                  ),
                  Text(
                    'Phone number',
                    style: ts,
                  ),
                  Text(
                    'Number of vehicles'.toString(),
                    style: ts,
                  ),
                  Text(
                    'Volume',
                    style: ts,
                  ),
                  Text(
                    'Type',
                    style: ts,
                  ),
                  Text(
                    'Expedition',
                    style: ts,
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  addTruck.nama!,
                  style: ts,
                ),
                Text(
                  addTruck.nopol!,
                  style: ts,
                ),
                Text(
                  addTruck.supir!,
                  style: ts,
                ),
                Text(
                  addTruck.status!,
                  style: ts,
                ),
                Text(
                  addTruck.telp!,
                  style: ts,
                ),
                Text(
                  addTruck.jumlah!.toString(),
                  style: ts,
                ),
                Text(
                  addTruck.volume!,
                  style: ts,
                ),
                Text(
                  addTruck.jenis!,
                  style: ts,
                ),
                Text(
                  addTruck.ekspedisi!,
                  style: ts,
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.print),
      ),
    );
  }
}

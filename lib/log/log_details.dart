import 'package:flutter/material.dart';
import 'package:sifods_interflour/log/log_checklist_container.dart';
import 'package:sifods_interflour/log/log_checklist_update.dart';
import 'package:sifods_interflour/log/log_checklist_vehicle.dart';
import 'package:sifods_interflour/log/log_container.dart';
import 'package:sifods_interflour/log/log_vehicle.dart';

class LogDetails extends StatelessWidget {
  const LogDetails({super.key, required this.id, required this.type});
  final int id;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: type == 'vehicle'
            ? LogVehicle(
                id: id,
              )
            : type == 'container'
                ? LogContainer(
                    id: id,
                  )
                : type == 'checklist_truck'
                    ? LogChecklistVehicle(
                        id: id,
                      )
                    : type == 'checklist_container'
                        ? LogChecklistContainer(id: id)
                        : LogChecklistUpdate(id: id));
  }
}

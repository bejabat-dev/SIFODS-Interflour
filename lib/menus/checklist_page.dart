import 'package:flutter/material.dart';
import 'package:sifods_interflour/auth/forgot.dart';
import 'package:sifods_interflour/checklists/checklist_container.dart';
import 'package:sifods_interflour/checklists/checklist_truck.dart';
import 'package:sifods_interflour/checklists/checklist_update.dart';
import 'package:sifods_interflour/utils/styles.dart';

class ChecklistPage extends StatelessWidget {
  ChecklistPage({super.key});

  final List<Map<String, dynamic>> menus = [
    {'name': 'Truck', 'icon': 'assets/truck.png', 'route': const ChecklistTruck()},
    {'name': 'Container', 'icon': 'assets/truck.png', 'route': const ChecklistContainer()},
    {'name': 'Update', 'icon': 'assets/truck.png', 'route': const ChecklistUpdate()},
  ];

  @override
  Widget build(BuildContext context) {
    final styles = Styles();
    return Scaffold(
      appBar: styles.customAppBar(context, 'Checklists'),
      body: Column(
        children: [
          Container(
            color: Colors.lightBlue,
            width: double.infinity,
            child: Image.asset(
              'assets/banner.png',
              height: 200,
            ),
          ),
          const SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Category'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: menus.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.87,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    crossAxisCount: 3),
                itemBuilder: (context, i) {
                  return Material(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    elevation: 2,
                    child: InkWell(
                      onTap: (){
                        utils.Navigate(context, menus[i]['route']);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8,bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              menus[i]['icon'],
                              width: 50,
                              height: 50,
                            ),
                            Text(
                              menus[i]['name'],
                              style: const TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Log'),
            ),
          )
        ],
      ),
    );
  }
}

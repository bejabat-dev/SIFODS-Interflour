import 'package:flutter/material.dart';
import 'package:sifods_interflour/auth/forgot.dart';
import 'package:sifods_interflour/menus/checklist_page.dart';
import 'package:sifods_interflour/menus/input_container.dart';
import 'package:sifods_interflour/menus/input_product.dart';
import 'package:sifods_interflour/menus/input_truck.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final List<Map<String, dynamic>> menus = [
    {'name': 'Truck', 'icon': 'assets/truck.png', 'route': const InputTruck()},
    {'name': 'Container', 'icon': 'assets/truck.png', 'route': const InputContainer()},
    {'name': 'Product', 'icon': 'assets/truck.png', 'route': const InputProduct()},
    {'name': 'Checklist', 'icon': 'assets/truck.png', 'route': ChecklistPage()},
    {'name': 'Corporate', 'icon': 'assets/truck.png', 'route': const InputTruck()},
    {'name': 'Contact', 'icon': 'assets/truck.png', 'route': const InputTruck()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(Icons.place,color: Color.fromARGB(255, 86, 86, 86),),
                    ),
                    Expanded(child: Text('Kecamatan Bengkong\nKota Batam')),
                    Text('12:30'),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Menu',
                  textAlign: TextAlign.start,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: GridView.builder(
                itemCount: menus.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.85,
                    mainAxisSpacing: 8,
                    crossAxisCount: 4),
                itemBuilder: (context, i) {
                  return Material(
                    borderRadius: BorderRadius.circular(12),
                    elevation: 2,
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
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
                            
                            styles.menuText(menus[i]['name'])
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Log activity',
                  textAlign: TextAlign.start,
                )),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, i) {
                  return const Text('data');
                }),
          )
        ],
      ),
    );
  }
}

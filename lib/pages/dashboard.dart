import 'package:flutter/material.dart';
import 'package:sifods_interflour/pages/home.dart';
import 'package:sifods_interflour/pages/profile.dart';
import 'package:sifods_interflour/pages/reports.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int index = 0;
  String appBarTitle = 'SIFODS';
  void selectIndex(int i) {
    index = i;
    appBarTitle = titles[i];
  }

  List<String> titles = ['SIFODS', 'Reports', 'Profile'];
  List<Widget> widgets = [Home(), const Reports(), const Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: widgets.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              selectIndex(value);
            });
          },
          currentIndex: index,
          selectedItemColor: Colors.blue,
          unselectedItemColor: const Color.fromARGB(255, 73, 73, 73),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Reports'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account')
          ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sifods_interflour/auth/login.dart';
import 'package:sifods_interflour/utils/networking.dart';
import 'package:sifods_interflour/utils/tools.dart';
import 'package:sifods_interflour/utils/userdata.dart';

final tools = Tools();
final userdata = Userdata();
final network = Networking();

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void start() async {
    await Future.delayed(const Duration(seconds: 1));
    await userdata.getPrefs();
    if (Userdata.userPrefs != null) {
      if (mounted) {
        if (Userdata.userPrefs!.getBool('loggedin') == true) {
          network.getUserData(
              context, Userdata.userPrefs!.getString('email')!);
        } else {
          tools.NavigateAndClear(context, Login());
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/logo.png')),
          const Text(
            'SIFODS',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          const Text('Sistem Informasi Food Safety')
        ],
      ),
    );
  }
}

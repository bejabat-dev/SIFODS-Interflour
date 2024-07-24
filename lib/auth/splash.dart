import 'package:flutter/material.dart';
import 'package:sifods_interflour/auth/login.dart';
import 'package:sifods_interflour/utils/tools.dart';

final tools = Tools();

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void start() async {
    await Future.delayed(const Duration(seconds: 1));
    if(mounted) tools.NavigateAndClear(context, Login());
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

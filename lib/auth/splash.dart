import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sifods_interflour/auth/login.dart';
import 'package:sifods_interflour/models/user.dart';
import 'package:sifods_interflour/utils/networking.dart';
import 'package:sifods_interflour/utils/tools.dart';

final tools = Tools();
final network = Networking();

class Splash extends ConsumerStatefulWidget {
  const Splash({super.key});

  @override
  ConsumerState<Splash> createState() => _SplashState();
}

class _SplashState extends ConsumerState<Splash> {
  void start() async {
    final prefs = await SharedPreferences.getInstance();
    var login = prefs.getBool('loggedin');

    await Future.delayed(const Duration(seconds: 1));
    if (login != null && login == true) {
      
    String? email = prefs.getString('email');
    String? password = prefs.getString('password');
    User user = User(email: email!, password: password!);
      if (mounted) {
        Networking().login(context, user, ref);
      }
    } else {
      if (mounted) {
        Tools().NavigateAndClear(context, Login());
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

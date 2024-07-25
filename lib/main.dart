import 'package:flutter/material.dart';
import 'package:sifods_interflour/auth/splash.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splash(),
      theme: ThemeData(
        cardColor: Colors.white,
        splashColor: const Color.fromARGB(255, 209, 209, 209),
        primaryColor: Colors.blue,
        indicatorColor: Colors.blue,
        unselectedWidgetColor: Colors.blue,
        checkboxTheme: CheckboxThemeData(
          side: const BorderSide(color: Colors.black,width: 1),
          fillColor: WidgetStateColor.resolveWith((Set states){
            
            if(states.contains(WidgetState.selected)){
              
              return Colors.blue;
            }
            return Colors.white;
          })
        ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.white, elevation: 2),
          dialogBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.blue,
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
              iconTheme: IconThemeData(size: 18, color: Colors.white)),
          scaffoldBackgroundColor: Colors.white),
    );
  }
}
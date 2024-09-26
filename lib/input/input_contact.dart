import 'package:flutter/material.dart';
import 'package:sifods_interflour/auth/forgot.dart';

class InputContact extends StatelessWidget {
  const InputContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: styles.customAppBar(context, 'Contact us'),);
  }
}
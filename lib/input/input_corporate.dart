import 'package:flutter/material.dart';
import 'package:sifods_interflour/auth/forgot.dart';

class InputCorporate extends StatelessWidget {
  const InputCorporate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: styles.customAppBar(context, 'Corporate'),
    );
  }
}
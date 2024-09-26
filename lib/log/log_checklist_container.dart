import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/auth/register.dart';

class LogChecklistContainer extends ConsumerWidget {
  const LogChecklistContainer({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: styles.customAppBar(context, 'Checklist container'),
    );
  }
}

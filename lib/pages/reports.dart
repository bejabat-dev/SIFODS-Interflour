import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sifods_interflour/auth/register.dart';
import 'package:sifods_interflour/pages/home.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _LogWidgetState();
}

class _LogWidgetState extends State<Reports> {
  final controller = TextEditingController();

  List<dynamic> searchData = [];

  Widget loadingIndicator = const Column(
    children: [
      Text('Loading logs'),
      SizedBox(
        height: 5,
      ),
      CupertinoActivityIndicator(),
    ],
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: 'Search logs',
                  suffixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 232, 232, 232),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none)),
            ),
          ),
          Expanded(child: Home().logWidget(context))
        ],
      ),
    );
  }
}

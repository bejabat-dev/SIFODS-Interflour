import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/networking/riverpod/vehiclespod.dart';
import 'package:sifods_interflour/widgets/log_search.dart';
import 'package:sifods_interflour/widgets/log_vehicles.dart';

class Reports extends ConsumerStatefulWidget {
  const Reports({super.key});

  @override
  ConsumerState<Reports> createState() => _LogWidgetState();
}

class _LogWidgetState extends ConsumerState<Reports> {
  final controller = TextEditingController();

  bool isSearching = false;

  Widget loadingIndicator = const Column(
    children: [
      Text('Loading logs'),
      SizedBox(
        height: 5,
      ),
      CupertinoActivityIndicator(),
    ],
  );

  void search() {
    if (controller.text.isNotEmpty) {
      setState(() {
        isSearching = true;
      });
      searchData.clear();
      for (var data in allData) {
        if (data.value.toLowerCase().contains(controller.text.toLowerCase())) {
          searchData.add(data);
        }
      }
    } else {
      setState(() {
        isSearching = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      search();
    });
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
          Expanded(
              child: isSearching == false
                  ? const LogVehicles()
                  : const LogSearch())
        ],
      ),
    );
  }
}

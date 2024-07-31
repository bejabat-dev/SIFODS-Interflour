import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sifods_interflour/auth/register.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _LogWidgetState();
}

class _LogWidgetState extends State<Reports> {
  List<dynamic>? logData;

  final controller = TextEditingController();

  List<dynamic> searchData = [];

  void search(){
    String query = controller.text.toLowerCase();
    setState(() {
      searchData = logData!.where((item){
        return item['value'].toLowerCase().contains(query);
      }).toList();
    });
  }

  Widget loadingIndicator = const Column(
    children: [
      Text('Loading logs'),
      SizedBox(
        height: 5,
      ),
      CupertinoActivityIndicator(),
    ],
  );

  void getLogs() async {
    final res = await networking.getLogs();
    if (res != null) {
      setState(() {
        logData = res;
        searchData = logData!;
        debugPrint(res.toString());
      });
    } else {
      loadingIndicator = const Center(child: Text('Log empty'));
    }
  }

  @override
  void initState() {
    super.initState();
    getLogs();
    controller.addListener(search);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
            child: searchData.isNotEmpty
                ? ListView.builder(
                    itemCount: searchData.length,
                    itemBuilder: (context, i) {
                      String date =
                          utils.formattedTime(searchData[i]['tanggal'].toString());
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                        child: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(searchData[i]['type']),
                                          Text(searchData[i]['value'])
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(date),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )),
                      );
                    })
                : loadingIndicator,
          ),
        ],
      ),
    );
  }
}

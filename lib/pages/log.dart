import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sifods_interflour/auth/register.dart';

class LogWidget extends StatefulWidget {
  const LogWidget({super.key});

  @override
  State<LogWidget> createState() => _LogWidgetState();
}

class _LogWidgetState extends State<LogWidget> {
  List<dynamic>? logData;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: logData != null
          ? ListView.builder(
              itemCount: logData!.length,
              itemBuilder: (context, i) {
                String date =
                    utils.formattedTime(logData![i]['tanggal'].toString());
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                  child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      child: InkWell(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(logData![i]['type']),
                                    Text(logData![i]['value'])
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
    );
  }
}

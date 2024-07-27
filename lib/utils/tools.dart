import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sifods_interflour/auth/register.dart';
import 'package:sifods_interflour/pages/dashboard.dart';

const loadingIndicator = CupertinoActivityIndicator();

class Tools {
  void showLoadingDialog(BuildContext context, String text) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loadingIndicator,
                  const SizedBox(
                    height: 5,
                  ),
                  Text(text)
                ],
              ),
            ),
          );
        });
  }

  void showErrorDialog(BuildContext context, String text) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(child: const Text('Konfirmasi')),
              )
            ],
            content: SizedBox(height: 80, child: Center(child: Text(text))),
          );
        });
  }

  String formattedTime(String timestampString) {
    final DateTime timestamp = DateTime.parse(timestampString);
    final String formattedTimestamp =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(timestamp);
    return formattedTimestamp;
  }

  void showConfirmDialog(BuildContext context, String text) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              InkWell(
                onTap: () {
                  utils.NavigateAndClear(context, Dashboard());
                },
                child: Center(child: const Text('Konfirmasi')),
              )
            ],
            content: SizedBox(height: 80, child: Center(child: Text(text))),
          );
        });
  }

  void showMessage(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 2),
    ));
  }

  void Navigate(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  void NavigateAndClear(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => widget), (route) => false);
  }
}

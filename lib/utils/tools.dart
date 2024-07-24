import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                child: const Text('Konfirmasi'),
              )
            ],
            content: Text(text),
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

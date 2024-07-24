import 'package:flutter/material.dart';
import 'package:sifods_interflour/utils/styles.dart';
import 'package:sifods_interflour/utils/tools.dart';

final styles = Styles();
final utils = Tools();

class Forgot extends StatelessWidget {
  final formKey = GlobalKey();
  Forgot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: Colors.black,
            )),
      ),
      body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png'),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, top: 15),
                  child: styles.authText('Reset password'),
                ),
                TextFormField(
                  decoration: styles.customInput(
                      'Enter your username or email', const Icon(Icons.email)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Material(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(child: styles.buttonText('Send')),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: styles.coloredText('Back to login',
                          const Color.fromARGB(255, 6, 110, 196)),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

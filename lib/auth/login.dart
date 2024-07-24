import 'package:flutter/material.dart';
import 'package:sifods_interflour/auth/forgot.dart';
import 'package:sifods_interflour/auth/register.dart';
import 'package:sifods_interflour/pages/dashboard.dart';
import 'package:sifods_interflour/utils/styles.dart';
import 'package:sifods_interflour/utils/tools.dart';

final styles = Styles();
final utils = Tools();

class Login extends StatelessWidget {
  final formKey = GlobalKey();
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: styles.authText('Login'),
                ),
                TextFormField(
                  decoration: styles.customInput(
                      'Username or Email', const Icon(Icons.email)),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: styles.customInput(
                      'Password', const Icon(Icons.password)),
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
                      onTap: () {
                        utils.NavigateAndClear(context, const Dashboard());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(child: styles.buttonText('Login')),
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
                        utils.Navigate(context, const Register());
                      },
                      child: styles.coloredText('Create new account',
                          const Color.fromARGB(255, 6, 110, 196)),
                    ),
                    const Text(' or '),
                    InkWell(
                      onTap: () {
                        utils.Navigate(context, Forgot());
                      },
                      child: styles.coloredText('Reset password',
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

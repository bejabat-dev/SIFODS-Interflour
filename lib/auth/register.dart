import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/models/user.dart';
import 'package:sifods_interflour/utils/styles.dart';
import 'package:sifods_interflour/utils/networking.dart';
import 'package:sifods_interflour/utils/tools.dart';

final styles = Styles();
final utils = Tools();
final networking = Networking();

class Register extends ConsumerStatefulWidget {
  const Register({super.key});

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends ConsumerState<Register> {
  final formKey = GlobalKey<FormState>();

  final nama = TextEditingController();
  final nomor_hp = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final repassword = TextEditingController();

  void register() {
    if (formKey.currentState?.validate() ?? false) {
      final user = User(
          email: email.text,
          nama: nama.text,
          jabatan: selectedJabatan,
          nomor_hp: nomor_hp.text,
          password: password.text, id: null, photo: '');
      Networking().register(context, user, ref);
    }
  }

  String selectedJabatan = 'Manager';
  List<String> jabatan = ['Manager', 'Assistant Manager', 'Staff', 'Operator'];

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
                  child: styles.authText('Register'),
                ),
                TextFormField(
                  controller: nama,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Invalid name';
                    }
                    if (value.length < 4) {
                      return 'Nama must be more than 4 characters';
                    }
                    return null;
                  },
                  decoration:
                      styles.customInput('Full name', const Icon(Icons.person)),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: nomor_hp,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Invalid phone number';
                    }
                    if (value.length < 4) {
                      return 'Phone number must be more than 4 characters';
                    }
                    return null;
                  },
                  decoration: styles.customInput(
                      'Nomor HP', const Icon(Icons.phone_android)),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Invalid email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Email not valid';
                    }
                    return null;
                  },
                  decoration:
                      styles.customInput('Email', const Icon(Icons.mail)),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                    iconEnabledColor: Colors.white,
                    decoration: styles.dropdownDecoration(
                        'Department',
                        const Icon(
                          Icons.group,
                          color: Colors.white,
                        )),
                    value: selectedJabatan,
                    items:
                        jabatan.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(value: value, child: Text(value));
                    }).toList(),
                    selectedItemBuilder: (context) {
                      return jabatan.map<Widget>((String item) {
                        return styles.coloredText(item, Colors.white);
                      }).toList();
                    },
                    onChanged: (newValue) {
                      setState(() {
                        selectedJabatan = newValue!;
                      });
                    }),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: true,
                  controller: password,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Password must be more than 6 characters';
                    }
                    return null;
                  },
                  decoration: styles.customInput(
                      'Password', const Icon(Icons.password)),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: true,
                  controller: repassword,
                  validator: (value) {
                    if (value != password.text) {
                      return "Password doesn't match";
                    }
                    return null;
                  },
                  decoration: styles.customInput(
                      'Repeat password', const Icon(Icons.password)),
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
                        register();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(child: styles.buttonText('Register')),
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

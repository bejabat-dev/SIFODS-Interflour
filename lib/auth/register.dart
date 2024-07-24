import 'package:flutter/material.dart';
import 'package:sifods_interflour/utils/styles.dart';
import 'package:sifods_interflour/utils/networking.dart';
import 'package:sifods_interflour/utils/tools.dart';

final styles = Styles();
final utils = Tools();
final networking = Networking();

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();

  final nama = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final repassword = TextEditingController();

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
                      return 'Nama tidak boleh kosong';
                    }
                    if (value.length < 4) {
                      return 'Nama harus melebihi 4 karakter';
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
                  controller: email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Email tidak valid';
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
                  controller: password,
                  validator: (value) {
                    if (value == null||value.length < 6) {
                      return 'Kata sandi harus melebihi 5 karakter';
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
                  controller: repassword,
                  validator: (value) {
                    if (value!=password.text) {
                      return 'Kata sandi tidak sama';
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
                        if (formKey.currentState?.validate() ?? false) {
                          networking.register(
                              context,
                              networking.userData(nama.text, email.text,
                                  password.text, selectedJabatan));
                        }
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

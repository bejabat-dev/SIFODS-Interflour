import 'package:flutter/material.dart';
import 'package:sifods_interflour/auth/register.dart';
import 'package:sifods_interflour/utils/styles.dart';
import 'package:sifods_interflour/utils/tools.dart';

class InputProduct extends StatefulWidget {
  const InputProduct({super.key});

  @override
  State<InputProduct> createState() => _InputContainerState();
}

class _InputContainerState extends State<InputProduct> {
  final utils = Tools();
  final formKey = GlobalKey<FormState>();

  final kode = TextEditingController();
  final nama = TextEditingController();

  Map<String, dynamic> data() {
    Map<String, dynamic> data = {
      'kode': kode.text,
      'nama': nama.text,
    };
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final styles = Styles();
    return Scaffold(
      appBar: styles.customAppBar(context, 'Input product'),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.lightBlue,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sistem Informasi Foods Safety\nPT. Eastern Pearl Flour Mills',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 80,
                      ),
                      Positioned(
                          bottom: -25, child: Image.asset('assets/stack.png'))
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: const TextStyle(fontSize: 15),
                      decoration: styles.customFormDecoration('ID Barang'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'ID tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      style: const TextStyle(fontSize: 15),
                      controller: nama,
                      decoration: styles.customFormDecoration('Kode Barang'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Masukkan kode barang';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      style: const TextStyle(fontSize: 15),
                      controller: kode,
                      decoration: styles.customFormDecoration('Nama Barang'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Masukkan nama barang';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue,
                            child: InkWell(
                              onTap: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  networking.uploadProduct(context, data());
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 8, 24, 8),
                                child: styles.coloredText('Save', Colors.white),
                              ),
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        Material(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 8, 24, 8),
                                child:
                                    styles.coloredText('Cancel', Colors.white),
                              ),
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        Material(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 8, 24, 8),
                                child: styles.coloredText('Exit', Colors.white),
                              ),
                            )),
                      ],
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sifods_interflour/auth/forgot.dart';
import 'package:sifods_interflour/utils/styles.dart';

class InputContainer extends StatefulWidget {
  const InputContainer({super.key});

  @override
  State<InputContainer> createState() => _InputContainerState();
}

class _InputContainerState extends State<InputContainer> {
  final formKey = GlobalKey();

  final idKendaraan = TextEditingController();
  final namaKendaraan = TextEditingController();
  final ekspedisi = TextEditingController();
  final namaSupir = TextEditingController();
  final noTelp = TextEditingController();
  final volumeMuatan = TextEditingController();
  final jumlahKendaraan = TextEditingController();

  final List<String> listKendaraan = ['Truck'];

  String jenisKendaraan = 'Truck';

  @override
  Widget build(BuildContext context) {
    final styles = Styles();
    return Scaffold(
      appBar: styles.customAppBar(context, 'Input container'),
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
                      controller: idKendaraan,
                      decoration: styles.customFormDecoration('ID Container'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          utils.showMessage(context, 'Fill all fields');
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      style: const TextStyle(fontSize: 15),
                      controller: namaKendaraan,
                      decoration: styles.customFormDecoration('No. Container'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          utils.showMessage(context, 'Fill all fields');
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      style: const TextStyle(fontSize: 15),
                      controller: ekspedisi,
                      decoration: styles.customFormDecoration('Nama Container'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          utils.showMessage(context, 'Fill all fields');
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      style: const TextStyle(fontSize: 15),
                      controller: namaSupir,
                      decoration: styles.customFormDecoration('No. Seal'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          utils.showMessage(context, 'Fill all fields');
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
                              onTap: () {},
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
                              onTap: () {Navigator.pop(context);},
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
                              onTap: () {Navigator.pop(context);},
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

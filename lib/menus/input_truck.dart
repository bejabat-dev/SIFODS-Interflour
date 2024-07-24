import 'package:flutter/material.dart';
import 'package:sifods_interflour/auth/forgot.dart';
import 'package:sifods_interflour/utils/styles.dart';

class InputTruck extends StatefulWidget {
  const InputTruck({super.key});

  @override
  State<InputTruck> createState() => _InputTruckState();
}

class _InputTruckState extends State<InputTruck> {
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
      appBar: styles.customAppBar(context, 'Input truck'),
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
                      decoration: styles.customFormDecoration('ID kendaraan'),
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
                      decoration: styles.customFormDecoration('Nama kendaraan'),
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
                      decoration: styles.customFormDecoration('Ekspedisi'),
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
                      decoration: styles.customFormDecoration('Nama supir'),
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
                    DropdownButtonFormField<String>(
                      iconEnabledColor: Colors.white,
                      value: jenisKendaraan,
                      items: listKendaraan
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      selectedItemBuilder: (context) {
                        return listKendaraan.map<Widget>((String value) {
                          return styles.coloredText(value, Colors.white);
                        }).toList();
                      },
                      onChanged: (value) {
                        jenisKendaraan = value!;
                      },
                      decoration:
                          styles.dropdownDecoration('Jenis kendaraan', null),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      style: const TextStyle(fontSize: 15),
                      controller: noTelp,
                      decoration: styles.customFormDecoration('No.Telpon/HP'),
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
                      controller: volumeMuatan,
                      decoration: styles.customFormDecoration('Volume muatan'),
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
                      controller: jumlahKendaraan,
                      decoration:
                          styles.customFormDecoration('Jumlah kendaraan'),
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

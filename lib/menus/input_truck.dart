import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/models/add_truck.dart';
import 'package:sifods_interflour/riverpod/userpod.dart';
import 'package:sifods_interflour/utils/styles.dart';
import 'package:sifods_interflour/utils/tools.dart';

class InputTruck extends ConsumerStatefulWidget {
  const InputTruck({super.key});

  @override
  InputTruckState createState() => InputTruckState();
}

class InputTruckState extends ConsumerState<InputTruck> {
  final utils = Tools();
  final formKey = GlobalKey<FormState>();

  final nopol = TextEditingController();
  final namaKendaraan = TextEditingController();
  final ekspedisi = TextEditingController();
  final namaSupir = TextEditingController();
  final noTelp = TextEditingController();
  final volumeMuatan = TextEditingController();
  final jumlahKendaraan = TextEditingController();

  final List<String> listKendaraan = [
    'Truk CDD',
    'Truk CDE',
    'Truk Kontainer',
    'Truk Trailer',
    'Truk Tronton',
    'Pick Up',
    'Wing Box'
  ];

  AddTruck getTruck() {
    final userId = ref.read(userProvider).user!.id!;
    return AddTruck(
        id_user: userId,
        nopol: nopol.text,
        nama: namaKendaraan.text,
        ekspedisi: ekspedisi.text,
        supir: namaSupir.text,
        jenis: jenisKendaraan,
        telp: noTelp.text,
        volume: volumeMuatan.text,
        jumlah: jumlahKendaraan.text);
  }

  String? jenisKendaraan;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final styles = Styles();
    return Scaffold(
      appBar: styles.customAppBar(context, 'Input truck'),
      body: SingleChildScrollView(
        child: Column(
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
                        controller: nopol,
                        decoration: styles.customFormDecoration('No. Polisi'),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 5) {
                            return 'Nomor polisi tidak sah';
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
                        decoration:
                            styles.customFormDecoration('Nama kendaraan'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Masukkan nama kendaraan';
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
                            return 'Masukkan nama ekspedisi';
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
                            return 'Masukkan nama supir';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      DropdownButtonFormField<String>(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Pilih kendaraan';
                          }
                          return null;
                        },
                        iconEnabledColor: Colors.white,
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
                        keyboardType: TextInputType.number,
                        decoration:
                            styles.customFormDecoration('No. Telpon/HP'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Masukkan nomor telpon/HP';
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
                        decoration:
                            styles.customFormDecoration('Volume muatan'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Masukkan volume muatan';
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
                        keyboardType: TextInputType.number,
                        decoration:
                            styles.customFormDecoration('Jumlah kendaraan'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Masukkan jumlah kendaraan';
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
                                  if (formKey.currentState?.validate() ??
                                      false) {}
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(24, 8, 24, 8),
                                  child:
                                      styles.coloredText('Save', Colors.white),
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
                                  child: styles.coloredText(
                                      'Cancel', Colors.white),
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
                                      styles.coloredText('Exit', Colors.white),
                                ),
                              )),
                        ],
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

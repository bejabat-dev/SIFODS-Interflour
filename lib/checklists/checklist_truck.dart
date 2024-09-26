import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/models/model_vehicle.dart';
import 'package:sifods_interflour/utils/helper.dart';
import 'package:sifods_interflour/utils/networking/vehicles.dart';
import 'package:sifods_interflour/utils/styles.dart';

class ChecklistTruck extends ConsumerStatefulWidget {
  const ChecklistTruck({super.key});

  @override
  ChecklistTruckState createState() => ChecklistTruckState();
}

class ChecklistTruckState extends ConsumerState<ChecklistTruck> {
  final dio = Dio();
  final formKey = GlobalKey<FormState>();

  final List<String> checks = [
    'Bebas dari Sampah/Kotoran/Sisa produk lain',
    'Lantai bersih & kering (tidak basah,lembab/berminyak)',
    'Tidak ada Jamur/Lumut/Sarang Laba2/ Serangga hidup/mati',
    'Tidak ada noda/ceceran yang dapat berpindah ke produk & mengkontaminasi (transfable)',
    'Tidak ada Residu (sisa) dari muatan sebelumnya',
    'Permukaan lantai/alas mulus dan tidak pecah (terutama lantai kayu), jika perlu menggunakan alas/terpal',
    'Ban dan baut pengikat roda dalam kondisi baik',
    'Tidak ada kebocoran pelumas dan bahan bakar',
    'Bebas dari bau menyengat/tajam/kotoran/apek'
  ];

  Map<String, bool> booleans = {
    'box0': false,
    'box1': false,
    'box2': false,
    'box3': false,
    'box4': false,
    'box5': false,
    'box6': false,
    'box7': false,
    'box8': false,
  };

  String? selectedNopol;

  ModelVehicle getModelTruck() {
    return ModelVehicle(
      idUser: Helper.user.id!,
      nopol: selectedNopol,
      box0: booleans['box0'],
      box1: booleans['box1'],
      box2: booleans['box2'],
      box3: booleans['box3'],
      box4: booleans['box4'],
      box5: booleans['box5'],
      box6: booleans['box6'],
      box7: booleans['box7'],
      box8: booleans['box8'], status: 'new',
    );
  }

  void saveTruck() async {
    await Vehicles().saveChecklistTruck(context, getModelTruck());
  }

  Widget indicatorWidget = const Row(
    children: [
      CupertinoActivityIndicator(),
      SizedBox(
        width: 5,
      ),
      Text('Loading vehicles')
    ],
  );

  List<String> nopols = [];

  void load() async {
    var data = await Vehicles().getNopol();
    if (data.isNotEmpty) {
      nopols.clear();
      for (var i in data) {
        nopols.add(i['nopol']);
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    final styles = Styles();
    return Scaffold(
      appBar: styles.customAppBar(context, 'Checklist Truck'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Material(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Parameter pemeriksaan',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Material(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                        child: Text(
                          'Hasil',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Form(
                  key: formKey,
                  child: nopols.isNotEmpty
                      ? DropdownButtonFormField<String>(
                          iconEnabledColor: Colors.white,
                          selectedItemBuilder: (context) {
                            return nopols.map<Widget>((String item) {
                              return styles.coloredText(item, Colors.white);
                            }).toList();
                          },
                          decoration:
                              styles.dropdownDecoration('No. Polisi', null),
                          items: nopols
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                                value: value, child: Text(value));
                          }).toList(),
                          onChanged: (value) {
                            selectedNopol = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Pilih no polisi';
                            }
                            return null;
                          },
                        )
                      : nopols.isEmpty
                          ? const Text('No data')
                          : indicatorWidget,
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          SliverList.builder(
              itemCount: checks.length,
              itemBuilder: (context, i) {
                var data = checks[i];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                  child: Row(
                    children: [
                      Expanded(child: Text(data)),
                      Checkbox(
                          value: booleans['box$i'],
                          onChanged: (value) {
                            setState(() {
                              booleans['box$i'] = value!;
                            });
                          })
                    ],
                  ),
                );
              }),
          SliverPadding(
            padding: const EdgeInsets.only(top: 8, bottom: 50),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Material(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      width: 150,
                      child: InkWell(
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            saveTruck();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: styles.coloredText('Post', Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

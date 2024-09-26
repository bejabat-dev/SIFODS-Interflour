import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sifods_interflour/networking/vehicles.dart';
import 'package:sifods_interflour/utils/styles.dart';

class ChecklistUpdate extends StatefulWidget {
  const ChecklistUpdate({super.key});

  @override
  State<ChecklistUpdate> createState() => _ChecklistTruckState();
}

class _ChecklistTruckState extends State<ChecklistUpdate> {
  final formKey = GlobalKey();

  final controller0 = TextEditingController();
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  final List<String> nomor = [];
  final List<String> checks = [
    'Dilakukan spraying inspektisida',
    'Menggunakan corrugated paper & terpasang dengan baik (jika diperlukan)',
    'Pemasangan label warning Fumigasi',
    'Segel terpasang dengan baik',
  ];

  Map<String, dynamic> booleans = {
    'box0': false,
    'box1': false,
    'box2': false,
    'box3': false,
  };

  String selectedNopol = 'BP 6556 AD';

  final List<String> koloms = [
    'Dilakukan fumigasi* ',
    'Dengan dosis* ',
    'No. Segel ',
    'Qty ',
  ];

  void load() async {
    final data = await Vehicles().getContainerToUpdate();
    if (data.isNotEmpty) {
      for (var i in data) {
        nomor.add(i['nomor']);
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
    final List<TextEditingController> textControllers = [
      controller0,
      controller1,
      controller2,
      controller3
    ];
    final styles = Styles();

    return Scaffold(
      appBar: styles.customAppBar(context, 'Update Container'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                const Text('Nomor container:'),
                const SizedBox(
                  height: 8,
                ),
                nomor.isNotEmpty
                    ? DropdownButtonFormField<String>(
                        iconEnabledColor: Colors.white,
                        selectedItemBuilder: (context) {
                          return List<Widget>.generate(nomor.length, (index) {
                            return styles.coloredText(
                                nomor[index], Colors.white);
                          });
                        },
                        decoration:
                            styles.dropdownDecoration('No. Container', null),
                        items: List<DropdownMenuItem<String>>.generate(
                            nomor.length, (index) {
                          return DropdownMenuItem(
                              value: '$index-${nomor[index]}',
                              child: Text(nomor[index]));
                        }),
                        onChanged: (value) {
                          selectedNopol = value!.split('-')[1];
                        },
                      )
                    : nomor.isEmpty
                        ? const Text('No data')
                        : const CupertinoActivityIndicator(),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 8),
              child: Center(
                  child: Text(
                'Proses Selanjutnya Jika Container Dipakai',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
          ),
          SliverList.builder(
              itemCount: checks.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                  child: Row(
                    children: [
                      Expanded(child: Text(checks[i])),
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
            padding: const EdgeInsets.all(8),
            sliver: SliverList.builder(
                itemCount: koloms.length,
                itemBuilder: (context, i) {
                  return Row(
                    children: [
                      Expanded(child: Text(koloms[i])),
                      const Text(' : '),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 1),
                        child: SizedBox(
                            width: 120,
                            child: TextField(
                              controller: textControllers[i],
                              style: const TextStyle(fontSize: 14),
                              textAlign: TextAlign.end,
                              decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(12, 0, 12, 0),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 240, 240, 240),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      borderSide: BorderSide.none)),
                            )),
                      )
                    ],
                  );
                }),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 8),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Material(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      width: 180,
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child:
                                  styles.coloredText('Update', Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
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
                      width: 180,
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              styles.coloredText('Preview/Print', Colors.white),
                              const SizedBox(
                                width: 4,
                              ),
                              const Icon(
                                Icons.print,
                                color: Colors.white,
                              )
                            ],
                          ),
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

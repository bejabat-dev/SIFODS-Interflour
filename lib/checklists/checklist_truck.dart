import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sifods_interflour/auth/register.dart';
import 'package:sifods_interflour/utils/styles.dart';
import 'package:sifods_interflour/utils/userdata.dart';

class ChecklistTruck extends StatefulWidget {
  const ChecklistTruck({super.key});

  @override
  State<ChecklistTruck> createState() => _ChecklistTruckState();
}

class _ChecklistTruckState extends State<ChecklistTruck> {
  final dio = Dio();
  final formKey = GlobalKey();

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

  Map<String, dynamic> booleans = {
    'id_user': Userdata.data!['id'],
    'nopol': 'asdsad',
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
  bool selected = false;

  String? selectedNopol;

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

  Future<void> getNopols() async {
    List<dynamic>? data = await networking.getNopols();
    if (data != null) {
      for (var map in data) {
        setState(() {
          nopols.add(map['nopol']);
        });
      }
    } else {
      indicatorWidget = const Text('Please add vehicle first');
    }
  }

  @override
  void initState() {
    super.initState();
    getNopols();
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
                nopols.isNotEmpty
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
                          selectedNopol = value!;
                          selected = true;
                        })
                    : indicatorWidget,
                const SizedBox(
                  height: 8,
                ),
              ],
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
                          if (selected) {
                            networking.addChecklistTruck(context, booleans,{});
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

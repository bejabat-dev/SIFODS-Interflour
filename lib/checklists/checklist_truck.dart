import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sifods_interflour/utils/styles.dart';

class ChecklistTruck extends StatefulWidget {
  const ChecklistTruck({super.key});

  @override
  State<ChecklistTruck> createState() => _ChecklistTruckState();
}

class _ChecklistTruckState extends State<ChecklistTruck> {
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


  @override
  void initState() {
    super.initState();
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
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                  child: Row(
                    children: [],
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

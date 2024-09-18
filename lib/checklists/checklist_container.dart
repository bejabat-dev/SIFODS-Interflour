import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/auth/register.dart';
import 'package:sifods_interflour/utils/helper.dart';
import 'package:sifods_interflour/utils/networking/vehicles.dart';
import 'package:sifods_interflour/utils/styles.dart';

class ChecklistContainer extends ConsumerStatefulWidget {
  const ChecklistContainer({super.key});

  @override
  ConsumerState<ChecklistContainer> createState() => _ChecklistContainerState();
}

class _ChecklistContainerState extends ConsumerState<ChecklistContainer> {
  final styles = Styles();
  final formKey = GlobalKey();
  final catatan = TextEditingController();

  final List<String> container = [];
  String selectedContainer = '';
  final List<String> internal = [
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

  final List<String> eksternal = [
    'Tidak ada kebocoran pada saat fooging',
    'Tidak ada label yang terpasan dari muatan sebelumnya',
    'Engsel, palang, gasket dan sea pintu baik & utuh',
    'Tidak ada kebocoran peluman dan bahan bakar',
    'Dilengkapi safety pin container',
    'Ban dalam kondisi yang baik',
    'Bebas stiker limbah B3',
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

  Map<String, bool> booleansEksternal = {
    'eks0': false,
    'eks1': false,
    'eks2': false,
    'eks3': false,
    'eks4': false,
    'eks5': false,
    'eks6': false,
  };

  Map<String, dynamic> containerData() {
    Map<String, dynamic> data = {};
    data['id_user'] = Helper.user.id!;
    data['nomor'] = selectedContainer;
    data.addAll(booleans);
    data.addAll(booleansEksternal);
    return data;
  }

  void save() async {
    Vehicles().saveChecklistContainer(context, containerData());
  }

  void load() async {
    container.clear();
    final data = await Vehicles().getContainer();
    if (data.isNotEmpty) {
      for (var i in data) {
        container.add(i['nomor']);
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
    return Scaffold(
      appBar: styles.customAppBar(context, 'Checklist Container'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
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
                  container.isNotEmpty
                      ? DropdownButtonFormField<String>(
                          iconEnabledColor: Colors.white,
                          selectedItemBuilder: (context) {
                            return container.map<Widget>((String item) {
                              return styles.coloredText(item, Colors.white);
                            }).toList();
                          },
                          decoration:
                              styles.dropdownDecoration('No. Container', null),
                          items: container
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                                value: value, child: Text(value));
                          }).toList(),
                          onChanged: (value) {
                            selectedContainer = value!;
                          })
                      : container.isEmpty
                          ? const Text('No data')
                          : const CupertinoActivityIndicator(),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Kebersihan (internal)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SliverList.builder(
                itemCount: internal.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                    child: Row(
                      children: [
                        Expanded(child: Text(internal[i])),
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
            const SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'Fisik (eksternal)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverList.builder(
                itemCount: eksternal.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                    child: Row(
                      children: [
                        Expanded(child: Text(eksternal[i])),
                        Checkbox(
                            value: booleansEksternal['eks$i'],
                            onChanged: (value) {
                              setState(() {
                                booleansEksternal['eks$i'] = value!;
                              });
                            })
                      ],
                    ),
                  );
                }),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: catatan,
                    maxLines: 3,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Note',
                        hintStyle: const TextStyle(fontSize: 14),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide())),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Material(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () {
                        if (selectedContainer.isEmpty) {
                          utils.showMessage(context, 'Please select container');
                        } else {
                          save();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
                        child: styles.coloredText('Post', Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

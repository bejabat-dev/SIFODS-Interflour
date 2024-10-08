import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sifods_interflour/auth/register.dart';
import 'package:sifods_interflour/auth/splash.dart';

class LogChecklistContainer extends ConsumerWidget {
  LogChecklistContainer({super.key, required this.id});
  final int id;

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: styles.customAppBar(context, 'Checklist container'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const IntrinsicHeight(
                child: Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nama Container'),
                        Text('No. Container'),
                        Text('No. Seal')
                      ],
                    ),
                    Column(
                      children: [
                        Text(' : '),
                        Text(' : '),
                        Text(' : '),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Container gue'),
                        Text('C11596'),
                        Text('B1578'),
                      ],
                    )
                  ],
                ),
              ),
            )),const SizedBox(height: 8,),
            const Text(
              'Kebersihan (internal)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
         
            ListView.builder(
                shrinkWrap: true,
                itemCount: internal.length,
                itemBuilder: (context, i) {
                  var data = internal[i];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      children: [
                        Expanded(child: Text(data)),
                        Checkbox(value: false, onChanged: (v) {})
                      ],
                    ),
                  );
                }),
            const Text(
              'Fisik (eksternal)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),const SizedBox(height: 8,),
            ListView.builder(
                shrinkWrap: true,
                itemCount: eksternal.length,
                itemBuilder: (context, i) {
                  var data = eksternal[i];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      children: [
                        Expanded(child: Text(data)),
                        Checkbox(value: false, onChanged: (v) {})
                      ],
                    ),
                  );
                }),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 50),
              child: TextField(
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
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          tools.showMessage(context, 'PDF saved');
        },
        child: const Icon(Icons.print),
      ),
    );
  }
}

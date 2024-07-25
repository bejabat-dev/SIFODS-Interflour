import 'package:flutter/material.dart';
import 'package:sifods_interflour/auth/forgot.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: styles.customAppBar(context, 'Edit profile'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Material(
              borderRadius: BorderRadius.circular(8),
              elevation: 2,
              color: Colors.blue,
              child: InkWell(
                onTap: () {},
                child: const SizedBox(
                  width: double.infinity,
                  child:  Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

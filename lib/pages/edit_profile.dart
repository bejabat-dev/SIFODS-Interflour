import 'package:flutter/material.dart';
import 'package:sifods_interflour/auth/forgot.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: styles.customAppBar(context, 'Edit profile'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/banner.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: TextFormField(
                          decoration:
                              styles.customInput('Full name', Icon(Icons.person)),
                        ),
                      ),Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: TextFormField(
                          decoration:
                              styles.customInput('Phone number', Icon(Icons.android)),
                        ),
                      ),
                    ],
                  )),
            ),
            Material(
              borderRadius: BorderRadius.circular(8),
              elevation: 2,
              color: Colors.blue,
              child: InkWell(
                onTap: () {},
                child: const SizedBox(
                  width: double.infinity,
                  child: Padding(
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

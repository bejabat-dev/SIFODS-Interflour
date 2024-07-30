import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sifods_interflour/auth/login.dart';
import 'package:sifods_interflour/pages/edit_profile.dart';
import 'package:sifods_interflour/utils/userdata.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Userdata.data != null
                ? Material(
                    color: Colors.white,
                    elevation: 2,
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.account_circle,
                            size: 85,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(Userdata.data!['nama']),
                                  Text(Userdata.data!['email']),
                                  Text(Userdata.data!['jabatan']),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                              height: 100,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        utils.Navigate(context, const EditProfile());
                                      }, child: const Text('Edit')),
                                  const Icon(Icons.edit)
                                ],
                              ))
                        ],
                      ),
                    ),
                  )
                : const CupertinoActivityIndicator(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Settings',
                    style: TextStyle(
                        fontSize: 17, color: Color.fromARGB(255, 14, 118, 202)),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                borderRadius: BorderRadius.circular(8),
                elevation: 2,
                color: Colors.white,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(Icons.password),
                            Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Text('Change password'),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(Icons.warning),
                            Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Text('About'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Material(
              color: Colors.blue,
              elevation: 2,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: () {
                  Userdata.userPrefs!.setBool('loggedin', false);
                  utils.NavigateAndClear(context, const Login());
                },
                child: const SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          'Sign out',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

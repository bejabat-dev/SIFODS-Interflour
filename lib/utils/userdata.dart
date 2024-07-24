import 'package:shared_preferences/shared_preferences.dart';

class Userdata {
  static Map<String,dynamic> data = {};
  static SharedPreferences? userPrefs;

  Future<void> getPrefs()async{
    userPrefs = await SharedPreferences.getInstance();
  }

}
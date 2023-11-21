import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences{
  static SharedPreferences ?prefs;
  static Future<void> init()async{
    try{
      prefs = await SharedPreferences.getInstance();
    }catch(e){
      debugPrint('>>>>>>>error ${e.toString()}');
    }
  }
}
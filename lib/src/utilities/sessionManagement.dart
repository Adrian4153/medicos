import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManagement{

  SharedPreferences  _sharedPreferences;
  String shared_pref_name = "session";
  String session_key ="session_user";

   Future<bool> setSession() async {

    _sharedPreferences = await SharedPreferences.getInstance();
    
     await _sharedPreferences.setBool(session_key,true);
  }

    Future<bool> getSession() async {

    //_sharedPreferences = await SharedPreferences.getInstance();
    if(_sharedPreferences == null){
      _sharedPreferences = await SharedPreferences.getInstance();
    }

    bool session = false;

    session = _sharedPreferences.getBool(session_key);

    return session;

   }

}

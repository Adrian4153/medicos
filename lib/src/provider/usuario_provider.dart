import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wecare_medics_ios/src/models/usuario_model.dart';
import 'package:wecare_medics_ios/src/utilities/sessionManagement.dart';
import 'package:wecare_medics_ios/src/utilities/utilities.dart';

class UsuarioProvider {

  String _baseUrl="";
  Utilities _utilities = new Utilities();
  SessionManagement _sessionManagement = new SessionManagement();


  Future<List<UsuarioModel>> userFromJson (String jsonString) async{
    final data = json.decode(jsonString);
    return List<UsuarioModel>.from(data.map((item) => UsuarioModel.fromJson(item)));
  }

  //

  Future<bool> login(String email, String pass,BuildContext context) async {

   _utilities.setPROD_TEST(false);
 

  _baseUrl = _utilities.getBASE_URL();

  Map<String,dynamic> mapa = Map<String,dynamic>();
  mapa["email"] = email;
 

  final resp = await http.post(_baseUrl+"Pacientes/login.php",body:json.encode(mapa));

  //List<UsuarioModel> us;

   Map<String,dynamic> decode = json.decode(resp.body);
   
   String passMD5 = md5.convert(utf8.encode(pass)).toString();
  
  decode.forEach((parametro, valor)async {

    print(valor);

    if(parametro == "pass" && valor == passMD5){

      SharedPreferences _sharedPrefs;

      _sessionManagement.setSession();

      return true;

    }else{

      return false;

    }
    
  });

   //UsuarioModel.fromJson(json.decode(resp.body));


  //us = UsuarioModel.fromJson(json.decode(resp.body));


  }
    
    
  
  

}
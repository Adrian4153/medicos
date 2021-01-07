import 'dart:convert';

import 'package:http/http.dart' as http;

class UsuarioProvider {

  final String _baseUrl="";

  Future<Map<String,dynamic>> login(String email,String password) async {

  Map<String,dynamic> mapa = Map<String,dynamic>();
  mapa["email"] = email;
  mapa["password"] = password;

  final resp = await http.post(_baseUrl,body:json.encode(mapa));
  
  final List<dynamic> decodeResp = json.decode(resp.body);

  final List<String> data = List<String>();

  decodeResp.forEach((dr) {
    String prodData = 

    data.add(value)

  })

  
  }

}
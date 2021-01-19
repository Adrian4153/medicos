import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'package:wecare_medics_ios/src/models/perfil_model.dart';
import 'package:wecare_medics_ios/src/models/usuario_model.dart';
import 'package:wecare_medics_ios/src/utilities/preferencias_usuario.dart';
import 'package:wecare_medics_ios/src/utilities/sessionManagement.dart';
import 'package:wecare_medics_ios/src/utilities/utilities.dart';

class UsuarioProvider {

  String _baseUrl="";
  Utilities _utilities = new Utilities();
  SessionManagement _sessionManagement = new SessionManagement();
  final prefs = new PreferenciasUsuario();


  Future<List<UsuarioModel>> userFromJson (String jsonString) async{
    final data = json.decode(jsonString);
    return List<UsuarioModel>.from(data.map((item) => UsuarioModel.fromJson(item)));
  }

  Future<PerfilModel>cargarPerfil()async{

    _utilities.setPROD_TEST(false);

    _baseUrl = _utilities.getBASE_URL();

    String usuario = await _sessionManagement.getIdUsuario();

    Map<String, dynamic> params = Map<String, dynamic>();
    params["idUsuario"] = usuario;

    final resp = await http.post(_baseUrl+'Empleados/selectDataEmpleado.php',body: json.encode(params));

    final Map<String,dynamic> decode = json.decode(resp.body);

    PerfilModel perfil = new PerfilModel();

    perfil = PerfilModel.fromJson(decode);
        
    return perfil;
  }

  //

  Future<bool> login(String email, String pass,BuildContext context) async {

   _utilities.setPROD_TEST(false);
 

  _baseUrl = _utilities.getBASE_URL();

  Map<String,dynamic> mapa = Map<String,dynamic>();
  mapa["email"] = email;
 

  final resp = await http.post(_baseUrl+"Empleados/login.php",body:json.encode(mapa));

  //List<UsuarioModel> us;

   Map<String,dynamic> decode = json.decode(resp.body);
   
   String passMD5 = md5.convert(utf8.encode(pass)).toString();

   
  
  decode.forEach((parametro, valor)async {


    if(decode['pass'] == passMD5 && valor == passMD5){

      _sessionManagement.setSession(true);
      
      _sessionManagement.setIdUsuario(decode['idUsuario']);

      _sessionManagement.setFolio(decode['folio']);

      return true;

    }else{

      return false;

    }
    
  });

   //UsuarioModel.fromJson(json.decode(resp.body));


  //us = UsuarioModel.fromJson(json.decode(resp.body));


  }

  Future<String> subirImagen(File imagen) async{

    final url= Uri.parse(_baseUrl+'');
    final mimeType = mime(imagen.path).split('/');

    final imageUploadRequest = http.MultipartRequest(
      'POST',
      url
    );  

    final file = await http.MultipartFile.fromPath(
      'file',
      imagen.path,
      contentType: MediaType(mimeType[0],mimeType[1])
      );

      imageUploadRequest.files.add(file);

      final streamResponse = await imageUploadRequest.send();

      final resp = await http.Response.fromStream(streamResponse);



  }
    
    
  
  

}
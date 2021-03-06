
import 'dart:convert';

UsuarioModel usaurioModelFromJson(String str) => UsuarioModel.fromJson(json.decode(str));

List<UsuarioModel> usuarioFromJson(String str)=> List<UsuarioModel>.from(json.decode(str).map((x) => UsuarioModel.fromJson(x)));

String usuarioModel(UsuarioModel data) => json.encode(data.toJson());


class UsuarioModel{


String folio;
String pass;
String nombres;
String paterno;
String materno;
String estatuscorreo;
String idUsuario;
String estatusPagadoRegistro;

UsuarioModel({

this.folio = '',
this.pass = '',
this.nombres = '',
this.paterno = '',
this.materno = '',
this.estatuscorreo = '',
this.idUsuario = '',
this.estatusPagadoRegistro = ''

});

factory UsuarioModel.fromJson(Map<String,dynamic> json) => new  UsuarioModel(

  folio          : json["folio"] ,
  pass           : json["pass"],
  nombres        : json ["nombres"],
  paterno        : json["paterno"],
  materno        : json["materno"],
  estatuscorreo  : json["estatuscorreo"],
  idUsuario      :json["idUsuario"],
  estatusPagadoRegistro  :json["estatusPagadoRegistro"]  

);

Map<String,dynamic> toJson()=>{

  "folio"         :folio,
  "pass"          :pass,
  "nombre"        :nombres,
  "paterno"       :paterno,
  "materno"       :materno,
  "estatuscorreo" :estatuscorreo,
  "idUsuario"     :idUsuario,
  "estatusPagadoRegistro"  : estatusPagadoRegistro

};



}
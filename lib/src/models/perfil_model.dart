// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

/*
tenemos una función que recive un JSON en forma de string y nos regresa
instancia de este modelo
*/
PerfilModel perfilModelFromJson(String str) => PerfilModel.fromJson(json.decode(str));

/*  
Otra función que toma el modelo y lo genera a un JSON 
*/
String perfilModelToJson(PerfilModel data) => json.encode(data.toJson());


//Definición del modelo con todas sus propiedades
class PerfilModel {

    String folio;
    String email;
    String telefono;
    String nombres;
    String paterno;
    String materno;
    String rol;
    String especialidad;
    String cedula;
    String calle;
    String numeroInterior;
    String numeroExterior;
    String colonia;
    String codigoPostal;
    String estatusPagoRegistro;


//Constructor para inicializar variables
    PerfilModel({
    this.folio,
    this.email = '',
    this.telefono = '',
    this.nombres = '',
    this.paterno = '',
    this.materno = '',
    this.rol = '',
    this.especialidad = '',
    this.cedula = '',
    this.calle = '',
    this.numeroInterior = '',
    this.numeroExterior = '',
    this.colonia = '',
    this.codigoPostal = '',
    this.estatusPagoRegistro = ''
    });


// Recibe un mapa llamado json y se le van asignar los valores a cada una de las propiedades
//que tenemos
//Es factory porque esta regresando una nueva instancia
    factory PerfilModel.fromJson(Map<String, dynamic> json) => new PerfilModel(
        folio         : json["folio"],
        email     : json["email"],
        telefono      : json["telefono"],
        nombres : json["nombres"],
        paterno    : json["paterno"],
        materno    : json["materno"],
        rol    : json["rol"],
        especialidad    : json["especialidad"],
        cedula    : json["cedula"],
        calle    : json["calle"],
        numeroInterior : json["numeroInterior"],
        numeroExterior    : json["numeroExterior"],
        colonia    : json["colonia"],
        codigoPostal    : json["codigoPostal"],
        estatusPagoRegistro    : json["estatusPagoRegistro"]
    );

    //Toma el modelo y lo transforma a un json (caso contrario)
    Map<String, dynamic> toJson() => {

      //Se comenta o elimina el parametro "id" ya que al editar se 
      // graba el parametro aparte del que ya está gravado
      //se puede dejar si es necesario o se ocupa o simplemente quitar
        //"id"         : id,
      "folio" : folio,
      "email" : email,
      "telefono" : telefono,
      "nombres" : nombres,
      "paterno" : paterno,
      "materno" : materno,
      "rol"     : rol,
      "especialidad" : especialidad,
      "cedula" : cedula,
      "calle"  : calle,
      "numeroInterior"  : numeroInterior,
      "numeroExterior" : numeroExterior,
      "colonia" : colonia,
      "codigoPostal" : codigoPostal,
      "estatusPagoRegistro" : estatusPagoRegistro
    };
}

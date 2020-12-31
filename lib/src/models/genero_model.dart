// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

/*
tenemos una función que recive un JSON en forma de string y nos regresa
instancia de este modelo
*/
GeneroModel generoModelFromJson(String str) => GeneroModel.fromJson(json.decode(str));

/*  
Otra función que toma el modelo y lo genera a un JSON 
*/
String generoModelToJson(GeneroModel data) => json.encode(data.toJson());


//Definición del modelo con todas sus propiedades
class GeneroModel {

    String idGenero;
    String genero;
    String estatus;
    


//Constructor para inicializar variables
    GeneroModel({
        this.idGenero = '',
        this.genero = '',
        this.estatus  = '',
    });


// Recibe un mapa llamado json y se le van asignar los valores a cada una de las propiedades
//que tenemos
//Es factory porque esta regresando una nueva instancia
    factory GeneroModel.fromJson(Map<String, dynamic> json) => new GeneroModel(
        idGenero   : json["idGenero"],
        genero     : json["genero"],
        estatus    : json["estatus"],
    );

    //Toma el modelo y lo transforma a un json (caso contrario)
    Map<String, dynamic> toJson() => {

      //Se comenta o elimina el parametro "id" ya que al editar se 
      // graba el parametro aparte del que ya está gravado
      //se puede dejar si es necesario o se ocupa o simplemente quitar
        "idGenero"         : idGenero,
        "genero"     : genero,
        "estatus"      : estatus
       
    };
}

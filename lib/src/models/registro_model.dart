import 'dart:convert';


RegistroModel registroModelFromJson(String str) => RegistroModel.fromJson(json.decode(str));


String registroModelToJson(RegistroModel data) => json.encode(data.toJson());

class RegistroModel{

  String nombre;
  String apellidoP;
  String apellidoM;
  String especialidad;
  String cedula;
  String telefono;
  String email;
  String password;
  String tipoUsuario;
  String genero;
  String fechaNacimiento;
  String nombreCompleto;
  String numVendedor;


  RegistroModel({

    
   this.nombre = '',
   this.apellidoP = '',
   this.apellidoM = '',
   this.especialidad = '',
   this.cedula = '',
   this.telefono = '',
   this.email = '',
   this.password = '',
   this.tipoUsuario = '',
   this.genero = '',
   this.fechaNacimiento = '',
   this.nombreCompleto = '',
   this.numVendedor = '',

  });

  


  factory RegistroModel.fromJson(Map<String, dynamic> json) => new RegistroModel(

   nombre         : json["nombres"],
   apellidoP      : json["paterno"],
   apellidoM      : json["materno"],
   especialidad   : json["idTipoEspecialidad"],
   cedula         : json["cedula"],
   telefono       : json["telefono"],
   email          : json["email"],
   password       : json["pass"],
   tipoUsuario    : json["rol"],
   genero         : json["genero"],
   fechaNacimiento: json["fechaNacimiento"],
   nombreCompleto : json["nombreCompleto"],
   numVendedor    : json["numeroVendedor"],


  );


  Map<String, dynamic> toJson() =>{

    "nombres"        : nombre,
    "paterno"     : apellidoP,
   "materno"      : apellidoM,
   "idTipoEspecialidad"   : especialidad,
   "cedula"         : cedula,
   "telefono"       : telefono,
   "email"          : email,
   "pass"       : password,
   "rol"    : tipoUsuario,
   "genero"         : genero,
   "fechaNacimiento": fechaNacimiento,
   "nombreCompleto" : nombreCompleto,
   "numeroVendedor"    : numVendedor, 

  };

}


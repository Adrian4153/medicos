import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:wecare_medics_ios/src/models/genero_model.dart';
import 'package:wecare_medics_ios/src/models/registro_model.dart';
import 'package:wecare_medics_ios/src/principal/arrays/arrays.dart';
import 'package:wecare_medics_ios/src/principal/home.dart';
import 'package:wecare_medics_ios/src/principal/mapMedico.dart';
import 'package:wecare_medics_ios/src/provider/genero_provider.dart';
import 'package:wecare_medics_ios/src/provider/registro_provider.dart';
import 'package:wecare_medics_ios/src/utilities/sessionManagement.dart';
import 'package:wecare_medics_ios/src/utilities/utilities.dart';

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  String nombres;

  String apellidoP;

  String apellidoM;

  String fechaN;

  String tipoUsuario;

  String genero;

  String especialidad;

  String cedula;

  String numTelefono;

  String email;

  String password;

  String confPassword;

  String numVendedor;

  Arrays arrays = new Arrays();

  int _idGenero = 0;

  String selecGenero = 'Selecciona';

  int _idTipoUsuario = 0;

  String selecTipo = 'Selecciona';

  int _idEspecialidad = 0;

  String selecEspecialidad = 'Selecciona';

  SessionManagement _sessionManag = new SessionManagement();

/*
  List<GeneroModel> listGenMo = new List();

  final generoP = GenerosProvider();

  Utilities objUtilities = new Utilities();
*/

  @override
  void initState() {
    super.initState();
  }

  void _checkSession() async {
    bool sesion = await _sessionManag.getSession();

    if (sesion == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MapMedic()));
    }
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[_fondoApp(), _formularioApp()],
      ),
    );
  }

  Widget _fondoApp() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('asset/inicial.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: null,
    );
  }

  Widget _logoApp() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  Image.asset(
                    'asset/logoBlanco.png',
                    alignment: Alignment.center,
                    width: 150.0,
                    height: 150.0,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _formularioApp() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _logoApp(),
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _subtitulo(),
                      _nombres(),
                      _apellidoP(),
                      _apellidoM(),
                      _fechaN(),
                      _genero(),
                      _tipoUsuario(),
                      _especialidad(),
                      _cedula(),
                      _numTelefono(),
                      _email(),
                      _password(),
                      _confPassword(),
                      _numVendedor(),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SafeArea(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                color: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 0.0),
                                child: Text('Registrarse',
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.black)),
                                onPressed: () async {
                                  if (!_formkey.currentState.validate()) {
                                    return;
                                  }

                                  _formkey.currentState.save();
                                  RegistroModel dataRegistro =
                                      new RegistroModel();
                                  RegistroProvider registro =
                                      new RegistroProvider();

                                  dataRegistro.nombre = nombres;
                                  dataRegistro.apellidoP = apellidoP;
                                  dataRegistro.apellidoM = apellidoM;
                                  dataRegistro.especialidad =
                                      _idEspecialidad.toString();
                                  dataRegistro.cedula = "";
                                  dataRegistro.telefono = numTelefono;
                                  dataRegistro.email = email;
                                  dataRegistro.password = password;
                                  dataRegistro.tipoUsuario = tipoUsuario;
                                  dataRegistro.genero = genero;
                                  dataRegistro.fechaNacimiento = fechaN;
                                  dataRegistro.nombreCompleto = nombres +
                                      " " +
                                      apellidoP +
                                      " " +
                                      apellidoM;
                                  dataRegistro.numVendedor = "";

                                  bool _checkRegistro = false;

                                  _checkRegistro = await registro
                                      .crearRegistro(dataRegistro);

                                  if (_checkRegistro == true && password == confPassword) {
                                    showDialog(
                                        context: context,
                                        builder: (_) => new AlertDialog(
                                              title: Text("Usuario registrado"),
                                              content: Text(
                                                  "Para ingresar valida tu correo y a continuación ve a login"),
                                              actions: <Widget>[
                                                FlatButton(
                                                    onPressed: () {
                                                      Navigator
                                                          .pushReplacementNamed(
                                                              context, "home");
                                                    },
                                                    child: Text(
                                                        "Aceptar"))
                                              ],
                                            ));
                                  }else{
                                       showDialog(
                                        context: context,
                                        builder: (_) => new AlertDialog(
                                              title: Text("Error de registro"),
                                              content: Text(
                                                  "A ocurrido un error intenta registrarte de nuevo y si el problema persiste comunicate a WECARE"),
                                              actions: <Widget>[
                                                FlatButton(
                                                    onPressed: () {
                                                    
                                                    },
                                                    child: Text(
                                                        "Intentar de nuevo"))
                                              ],
                                            ));
                                  }
                                },
                              ),
                              FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                color: Colors.white,
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 0.0),
                                    child: Text('Cancelar',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black))),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _subtitulo() {
    final estiloSubtitulo = TextStyle(
        fontWeight: FontWeight.w500, fontSize: 19.0, color: Colors.white);
    return Text(
      'Registrese con los datos solicitados',
      style: estiloSubtitulo,
    );
  }

  Widget _nombres() {
    const InputDecoration inputDecoration = InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0));

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Nombre(s)',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white)),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                      decoration: inputDecoration.copyWith(),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Campo nombre es requerido';
                        }
                      },
                      onSaved: (String value) {
                        nombres = value;
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _apellidoP() {
    const InputDecoration inputDecoration = InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0));

    return SafeArea(
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Apellido Paterno',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white)),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                      decoration: inputDecoration.copyWith(),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Campo apellido paterno es requerido';
                        }
                      },
                      onSaved: (String value) {
                        apellidoP = value;
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _apellidoM() {
    const InputDecoration inputDecoration = InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0));

    return SafeArea(
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Apellido Materno',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white)),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                      decoration: inputDecoration.copyWith(),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Campo apellido materno es requerido';
                        }
                      },
                      onSaved: (String value) {
                        apellidoM = value;
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _fechaN() {
    const InputDecoration inputDecoration = InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0));

    return SafeArea(
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Fecha de nacimiento',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white)),
                  SizedBox(
                    height: 10.0,
                  ),
                  DateTimePicker(
                    decoration: inputDecoration.copyWith(),
                    type: DateTimePickerType.date,
                    dateMask: 'd MMM, yyyy',
                    locale: const Locale('es', ""),
                    initialValue: DateTime.now().toString(),
                    firstDate: DateTime(1970),
                    lastDate: DateTime.now(),
                    icon: Icon(Icons.event),
                    onChanged: (val) => print(val),
                    validator: (val) {
                      fechaN = val;
                      print(val);
                      return null;
                    },
                    onSaved: (String val) {
                      fechaN = val;
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesGenero() {
    List<DropdownMenuItem<String>> lista = new List();

    arrays.generos.forEach((genero) {
      lista.add(DropdownMenuItem(
        child: Text(genero),
        value: genero,
      ));
    });

    return lista;
  }

  List<DropdownMenuItem<String>> getOpcionesTipoUsuario() {
    List<DropdownMenuItem<String>> lista = new List();

    arrays.tipoUsuario.forEach((tipoUsuario) {
      lista.add(DropdownMenuItem(
        child: Text(tipoUsuario),
        value: tipoUsuario,
      ));
    });

    return lista;
  }

  List<DropdownMenuItem<String>> getOpcionesEspecialidad() {
    List<DropdownMenuItem<String>> lista = new List();

    arrays.especialidades.forEach((especialidad) {
      lista.add(DropdownMenuItem(
        child: Text(especialidad),
        value: especialidad,
      ));
    });

    return lista;
  }

  Widget _genero() {
    return SafeArea(
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Genero',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white)),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: DropdownButton(
                        items: getOpcionesGenero(),
                        isExpanded: true,
                        iconEnabledColor: Colors.blue,
                        iconSize: 35,
                        underline: SizedBox(),
                        value: selecGenero,
                        style: TextStyle(color: Colors.black),
                        onChanged: (opt) {
                          setState(() {
                            _idGenero = arrays.generos.indexOf(opt);
                            selecGenero = opt;
                            //Valor en string
                            genero = opt;
                          });
                        },
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

/*

  Widget _genero() {
    return SafeArea(
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Genero',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white)),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child:FutureBuilder<List<GeneroModel>>(
                      future:generoP.cargarGeneros(),
                      builder: (BuildContext context, AsyncSnapshot<List<GeneroModel>> snapshot) {
                        if(snapshot.hasData){

                          List<DropdownMenuItem<String>> lista = new List();

                          snapshot.data.forEach((genero) { 
                              print(genero.genero);
                              lista.add(new DropdownMenuItem(
                                child: Text(genero.genero),
                                value: genero.idGenero,
                              ));

                          });

                          return DropdownButton(
                      items: lista,
                      isExpanded: true,
                      iconEnabledColor: Colors.blue,
                      iconSize: 35,
                      //Elimina linea de dropdown
                      underline: SizedBox(),
                     
                      style: TextStyle(color: Colors.black),
                      onChanged: (opt) {
                        setState(() {
                          selecGenero = opt;
                        });
                      },
                    );
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


 */

  Widget _tipoUsuario() {
    return SafeArea(
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Tipo',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white)),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: DropdownButton(
                      items: getOpcionesTipoUsuario(),
                      isExpanded: true,
                      iconEnabledColor: Colors.blue,
                      iconSize: 35,
                      //Elimina linea de dropdown
                      underline: SizedBox(),
                      value: selecTipo,
                      style: TextStyle(color: Colors.black),
                      onChanged: (opt) {
                        setState(() {
                          _idTipoUsuario = arrays.tipoUsuario.indexOf(opt);
                          selecTipo = opt;
                          //valor en string
                          tipoUsuario = opt;
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _especialidad() {
    return SafeArea(
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Especialidad',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white)),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: DropdownButton(
                      items: getOpcionesEspecialidad(),
                      isExpanded: true,
                      iconEnabledColor: Colors.blue,
                      iconSize: 35,
                      //Elimina linea de dropdown
                      underline: SizedBox(),
                      value: selecEspecialidad,
                      style: TextStyle(color: Colors.black),
                      onChanged: (opt) {
                        setState(() {
                          _idEspecialidad = arrays.especialidades.indexOf(opt);
                          selecEspecialidad = opt;
                          //valor en string
                          especialidad = opt;
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cedula() {
    const InputDecoration inputDecoration = InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0));

    return SafeArea(
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Cedula',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white)),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                      decoration: inputDecoration.copyWith(),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Campo cedula es requerido';
                        }
                      },
                      onSaved: (String value) {
                        cedula = value;
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _numTelefono() {
    const InputDecoration inputDecoration = InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0));

    return SafeArea(
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('No. de teléfono',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white)),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                      decoration: inputDecoration.copyWith(),
                      keyboardType: TextInputType.number,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Campo No. de teléfono es requerido';
                        }
                      },
                      onSaved: (String value) {
                        numTelefono = value;
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _email() {
    const InputDecoration inputDecoration = InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0));

    return SafeArea(
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Email',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white)),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: inputDecoration.copyWith(),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Campo email es requerido';
                      }
                    },
                    onSaved: (String value) {
                      email = value;
                    },
                    onChanged: (_email) {
                      setState(() {
                        email = _email;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _password() {
    const InputDecoration inputDecoration = InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0));

    return SafeArea(
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Contraseña',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white)),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: inputDecoration.copyWith(),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Campo contraseña es requerido';
                      }
                    },
                    onSaved: (String value) {
                      password = value;
                    },
                    onChanged: (_email) {
                      setState(() {
                        email = _email;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _confPassword() {
    const InputDecoration inputDecoration = InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0));

    return SafeArea(
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Confirme su contraseña',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white)),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: inputDecoration.copyWith(),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Campo confirmar contraseña es requerido';
                      }
                    },
                    onSaved: (String value) {
                      confPassword = value;
                    },
                    onChanged: (_email) {
                      setState(() {
                        email = _email;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _numVendedor() {
    const InputDecoration inputDecoration = InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0));

    return SafeArea(
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('No. de vendedor',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white)),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                      decoration: inputDecoration.copyWith(),
                      keyboardType: TextInputType.number,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Campo No. de vendedor es requerido';
                        }
                      },
                      onSaved: (String value) {
                        numVendedor = value;
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

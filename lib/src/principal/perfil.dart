import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wecare_medics_ios/src/models/perfil_model.dart';
import 'package:wecare_medics_ios/src/models/usuario_model.dart';
import 'package:wecare_medics_ios/src/principal/pago.dart';
import 'package:wecare_medics_ios/src/provider/usuario_provider.dart';
import 'package:wecare_medics_ios/src/utilities/sessionManagement.dart';

import 'home.dart';

class PerfilPage extends StatelessWidget {



  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

     SessionManagement _sessionManag = new SessionManagement();

     UsuarioProvider _usuario = new UsuarioProvider();

     UsuarioModel us = new UsuarioModel();
     String usuario;


  @override
  Widget build(BuildContext context) {

     
    
    return Scaffold(
      appBar: AppBar(
        title: Text('WECARE')),
      body: Stack(
        children: [_fondoApp(), _fotoPerfil(context)],
      ),
    );
  }


  Widget _fondoApp() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('asset/inicial.png'), fit: BoxFit.cover),
      ),
    );
  }

  

  Widget _fotoPerfil(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 15.0),
        child: Column(
          children: <Widget>[
          
            Image.asset(
              'asset/usuario.png',
              alignment: Alignment.center,
            ),
            Container(
              child: Expanded(child: _viewPerfil(context)),
            )
          ],
        ));
  }

  Widget _viewPerfil(BuildContext context) {

    final orientation = MediaQuery.of(context);
    final size = MediaQuery.of(context).size;
    final largo = size.height - 200;
    

    return SingleChildScrollView(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
              height: orientation.orientation == Orientation.portrait ? 500: largo,
              alignment: Alignment.center,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.white30,
                // Con esta propiedad agregamos margen a nuestro Card
                // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
                margin: EdgeInsets.all(12),

                // Con esta propiedad agregamos elevación a nuestro card
                // La sombra que tiene el Card aumentará
                elevation: 0,
                child: ListView(
                  children: [
                  
                  _crearNombre(context),
                  _numCedula(context),
                  _especialidad(context),
                  _correo(context),
                  _numTelefonico(context),
                  _domicilio(context),
                  _crearFolio(context),
                  _tipoUsuario(context),
                  _estatusPago(context),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              color: Colors.white,
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 0.0),
                                  child: Text('CERRAR SESIÓN',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black))),
                              onPressed: () {
                                _sessionManag.removeData();
                                Navigator.push(context,MaterialPageRoute(builder: (context)=> HomePage()));
                              },
                            ),
                       
                            FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              color: Colors.white,
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 0.0),
                                  child: Text('EDITAR PERFIL',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black))),
                              onPressed: () {
                                //Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _crearFolio(BuildContext context){
    return FutureBuilder(
      future: _usuario.cargarPerfil(),
      builder: (BuildContext context, AsyncSnapshot<PerfilModel> snapshot) {
        if ( snapshot.hasData ) {
          

          PerfilModel _perf = new PerfilModel();

            _perf =snapshot.data;

          return ListTile(
            title: Text("Folio:"),
            subtitle: _perf.folio != null ? Text("${_perf.folio}") :  Text(""),
          );
         
        } else {
          return Center( child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearNombre(BuildContext context){
  return FutureBuilder(
      future: _usuario.cargarPerfil(),
      builder: (BuildContext context, AsyncSnapshot<PerfilModel> snapshot) {
        if ( snapshot.hasData ) {
          

          PerfilModel _perf = new PerfilModel();

            _perf =snapshot.data;

          return ListTile(
            title: Text("Nombre:"),
            subtitle: _perf.nombres != null || _perf.paterno != null || _perf.materno != null ? 
            Text("${_perf.nombres} ${_perf.paterno} ${_perf.materno}") : Text("${_perf.nombres} ${_perf.paterno} ${_perf.materno}"),
          );
         
        } else {
        return Center( );
        }
      },
    );

  }

 

  Widget _numCedula(BuildContext context) {
    return FutureBuilder(
      future: _usuario.cargarPerfil(),
      builder: (BuildContext context, AsyncSnapshot<PerfilModel> snapshot){
        if(snapshot.hasData){
          PerfilModel _perf = new PerfilModel();

          _perf = snapshot.data;

          return ListTile(
            title: Text("Cedula: "),
            subtitle: _perf.cedula != null ? Text("${_perf.cedula} "): Text(""),
          );
        } else {
        return Center( );
        }
      }
      );
  }

  Widget _especialidad(BuildContext context) {
    return FutureBuilder(
      future: _usuario.cargarPerfil(),
      builder: (BuildContext context, AsyncSnapshot<PerfilModel> snapshot){
        if(snapshot.hasData){
          PerfilModel _perf = new PerfilModel();

          _perf = snapshot.data;

          return ListTile(
            title: Text("Cedula: "),
            subtitle:  _perf.especialidad != null ? Text("${_perf.especialidad} "): Text(""),
          );
        } else {
          return Center( );
        }
      }
      );
  }

  Widget _correo(BuildContext context) {
    return FutureBuilder(
      future: _usuario.cargarPerfil(),
      builder: (BuildContext context, AsyncSnapshot<PerfilModel> snapshot){
        if(snapshot.hasData){
          PerfilModel _perf = new PerfilModel();

          _perf = snapshot.data;

          return ListTile(
            title: Text("Correo: "),
            subtitle:  _perf.email != null ? Text("${_perf.email} "): Text(""),
          );
        } else {
          return Center( );
        }
      }
      );
  }

  Widget _numTelefonico(BuildContext context) {
    return FutureBuilder(
      future: _usuario.cargarPerfil(),
      builder: (BuildContext context, AsyncSnapshot<PerfilModel> snapshot){
        if(snapshot.hasData){
          PerfilModel _perf = new PerfilModel();

          _perf = snapshot.data;

          return ListTile(
            title: Text("Teléfono: "),
            subtitle:  _perf.telefono != null ? Text("${_perf.telefono} "): Text(""),
          );
        } else {
          return Center( );
        }
      }
      );
  }

  Widget _domicilio(BuildContext context) {
     return FutureBuilder(
      future: _usuario.cargarPerfil(),
      builder: (BuildContext context, AsyncSnapshot<PerfilModel> snapshot){
        if(snapshot.hasData){
          PerfilModel _perf = new PerfilModel();

          _perf = snapshot.data;

          return ListTile(
            title: Text("Domicilio: "),
            subtitle: _perf.calle != null && _perf.colonia != null ? 
            Text("${_perf.calle} ${_perf.colonia}") : Text(""),
          );
        } else {
          return Center( );
        }
      }
      );
  }

  Widget _numFolio(BuildContext context) {
     return FutureBuilder(
      future: _usuario.cargarPerfil(),
      builder: (BuildContext context, AsyncSnapshot<PerfilModel> snapshot){
        if(snapshot.hasData){
          PerfilModel _perf = new PerfilModel();

          _perf = snapshot.data;

          return ListTile(
            title: Text("Folio: "),
            subtitle:_perf.folio != null ? Text("${_perf.folio} ") : Text(""),
          );
        } else {
         return Center( );
        }
      }
      );
  }

  Widget _tipoUsuario(BuildContext context) {
      return FutureBuilder(
      future: _usuario.cargarPerfil(),
      builder: (BuildContext context, AsyncSnapshot<PerfilModel> snapshot){
        if(snapshot.hasData){
          PerfilModel _perf = new PerfilModel();

          _perf = snapshot.data;

          return ListTile(
            title: Text("Tipo usuario: "),
            subtitle: _perf.rol != null ? Text("${_perf.rol}") : Text(""),
          );
        } else {
          return Center( );
        }
      }
      );
  }

   Widget _estatusPago(BuildContext context) {
      return FutureBuilder(
      future: _usuario.cargarPerfil(),
      builder: (BuildContext context, AsyncSnapshot<PerfilModel> snapshot){
        if(snapshot.hasData){
          PerfilModel _perf = new PerfilModel();

          _perf = snapshot.data;

          return ListTile(
            title: Text("Estatus de pago: "),
            subtitle: _perf.estatusPagoRegistro == 1 ? Text("Pagado") : 
             FlatButton(
                             
                              color: Colors.white38,
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 0.0),
                                  child: Text('Pago pendiente',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black))),
                              onPressed: () {
                               
                                Navigator.push(context,MaterialPageRoute(builder: (context)=> PagoPage()));
                              },
                            ),
            
          );
        } else {
          return Center( );
        }
      }
      );
  }
  }

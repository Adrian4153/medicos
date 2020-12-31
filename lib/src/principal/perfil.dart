import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
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
                    _nombreCompleto(),
                    _numCedula(),
                    _especialidad(),
                    _correo(),
                    _numTelefonico(),
                    _domicilio(),
                    _numFolio(),
                    _tipoUsuario(),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 0.0),
                              child: Text('CERRAR SESIÓN',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.black)),
                              onPressed: () {
                                if (!_formkey.currentState.validate()) {
                                  return;
                                }

                                _formkey.currentState.save();
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

  Widget _nombreCompleto() {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
              title: Text('Nombre completo: '),
              subtitle: Text('Eduardo Gutierrez Sandoval'))
        ],
      ),
    );
  }

  Widget _numCedula() {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Num cedula: '),
            subtitle: Text('27XXXX'),
          )
        ],
      ),
    );
  }

  Widget _especialidad() {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Especialidad: '),
            subtitle: Text('Especialidad'),
          )
        ],
      ),
    );
  }

  Widget _correo() {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Correo: '),
            subtitle: Text('correo@correo.com'),
          ),
        ],
      ),
    );
  }

  Widget _numTelefonico() {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Num teléfonico: '),
            subtitle: Text('4444444444'),
          )
        ],
      ),
    );
  }

  Widget _domicilio() {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Domicilio: '),
            subtitle: Text('Los cumbres del lago '),
          )
        ],
      ),
    );
  }

  Widget _numFolio() {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Num foliio: '),
            subtitle: Text('89238923'),
          )
        ],
      ),
    );
  }

  Widget _tipoUsuario() {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Tipo usuario: '),
            subtitle: Text('Médico'),
          )
        ],
      ),
    );
  }
}

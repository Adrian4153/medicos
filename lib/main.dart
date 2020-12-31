import 'package:flutter/material.dart';
import 'package:wecare_medics_ios/src/principal/future.dart';
import 'package:wecare_medics_ios/src/principal/home.dart';
import 'package:wecare_medics_ios/src/principal/login.dart';
import 'package:wecare_medics_ios/src/principal/mapMedico.dart';
import 'package:wecare_medics_ios/src/principal/perfil.dart';
import 'package:wecare_medics_ios/src/pruebas/prueba.dart';
import 'package:wecare_medics_ios/src/principal/registro.dart';
import 'package:wecare_medics_ios/src/pruebas/registroPrueba.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'WECAREMEDICS',
      initialRoute: 'registroPrueba',
      routes: {

        'home'     : (BuildContext context) => HomePage(),
        'login'    : (BuildContext context) => LoginPage(),
        'registro' : (BuildContext context) => RegistroPage(),
        'mapMedico': (BuildContext context) => MapMedic(),
        'perfil'   : (BuildContext context) => PerfilPage(),

        //pruebas select e insert
        'prueba'  : (BuildContext context) => PruebaPage(),
        'registroPrueba' : (BuildContext context) => RegistroPruebaPage(),
        'future' : (BuildContext context) => FuturePage()
         
      },
    );
  }
}





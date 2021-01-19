import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wecare_medics_ios/src/principal/future.dart';
import 'package:wecare_medics_ios/src/principal/home.dart';
import 'package:wecare_medics_ios/src/principal/login.dart';
import 'package:wecare_medics_ios/src/principal/mapMedico.dart';
import 'package:wecare_medics_ios/src/principal/pago.dart';
import 'package:wecare_medics_ios/src/principal/perfil.dart';
import 'package:wecare_medics_ios/src/principal/solicitudServicio.dart';
import 'package:wecare_medics_ios/src/pruebas/prueba.dart';
import 'package:wecare_medics_ios/src/principal/registro.dart';
import 'package:wecare_medics_ios/src/pruebas/registroPrueba.dart';


void main(){
  runApp(MyApp());
  }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
   // print("sesion main: "+_sessionManag.getSession());
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'WECAREMEDICS',
      initialRoute: 'home',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('es',''),
      ],
      routes: {

        'home'     : (BuildContext context) => HomePage(),
        'login'    : (BuildContext context) => LoginPage(),
        'registro' : (BuildContext context) => RegistroPage(),
        'mapMedico': (BuildContext context) => MapMedic(),
        'solicitudServicio': (BuildContext context) => SolicitudServicioPage(),
        'perfil'   : (BuildContext context) => PerfilPage(),
        'pago'     : (BuildContext context) => PagoPage(),

        //pruebas select e insert
        'prueba'  : (BuildContext context) => PruebaPage(),
        'registroPrueba' : (BuildContext context) => RegistroPruebaPage(),
        'future' : (BuildContext context) => FuturePage(),
        
         
      },
    );
  }

}





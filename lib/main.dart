import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wecare_medics_ios/src/principal/future.dart';
import 'package:wecare_medics_ios/src/principal/home.dart';
import 'package:wecare_medics_ios/src/principal/login.dart';
import 'package:wecare_medics_ios/src/principal/mapMedico.dart';
import 'package:wecare_medics_ios/src/principal/perfil.dart';
import 'package:wecare_medics_ios/src/pruebas/prueba.dart';
import 'package:wecare_medics_ios/src/principal/registro.dart';
import 'package:wecare_medics_ios/src/pruebas/registroPrueba.dart';
import 'package:wecare_medics_ios/src/utilities/sessionManagement.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences sharedPrefs;
  bool firstSession = false;

  @override
  void initState() { 
    super.initState();
    checkSession();
    
  }

  void checkSession() async {
    sharedPrefs = await SharedPreferences.getInstance();

    
    sharedPrefs.setBool('session_user', false);

    bool seeSession = sharedPrefs.getBool("session_user");

    if(seeSession){

      setState(() {
        firstSession = true;
      });

    }else{

      setState(() {
        firstSession = false;
      });

    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'WECAREMEDICS',
      initialRoute: firstSession == false ? 'home':'mapMedico',
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





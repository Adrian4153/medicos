import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:wecare_medics_ios/src/models/usuario_model.dart';
import 'package:wecare_medics_ios/src/principal/home.dart';
import 'package:wecare_medics_ios/src/principal/mapMedico.dart';
import 'package:wecare_medics_ios/src/provider/usuario_provider.dart';
import 'package:wecare_medics_ios/src/utilities/sessionManagement.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String email;

  String password;

  SessionManagement _sessionManag = new SessionManagement();

  bool firstSession = false;

  UsuarioProvider usuario = UsuarioProvider();

  @override
  void initState(){
    super.initState();
    _checkSession();
  

  }

  void _checkSession()async{
  bool sesion =await  _sessionManag.getSession();
    
    if(sesion == true){

      setState(() {
         firstSession = true;
        Navigator.push(context, MaterialPageRoute(builder: (context)=> MapMedic()));
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
       children:<Widget>[
         _fondoApp(context),
         _loginForm(context),
       ],
      ),
    );
  }

Widget _fondoApp( BuildContext contex){
  return Stack(
    //fondo
    children: <Widget>[
      Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('asset/inicial.png'),
          fit: BoxFit.cover
        )
      ),
      ),
     
    ],
  );
}

Widget _logoApp(BuildContext context){
  final orientation = MediaQuery.of(context);

  return  Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
            child: Column(
              children: [
                Image.asset(
                    'asset/logoBlanco.png',
                    alignment: Alignment.center,
                  width: orientation.orientation == Orientation.portrait? 200.0:170,
                    height:  orientation.orientation == Orientation.portrait? 300.0:200.0,
                    ),
              ],
            ),
            ),
          ],
        ),
        );
}

Widget _loginForm(BuildContext context){

  return SingleChildScrollView(

    child:  Container(
          margin: EdgeInsets.all(25.0),
          child: Container(
            margin: const EdgeInsets.only(top: 0.0),
            child: Form(
              key: _formkey,
                child: Column(
                children: <Widget>[
                  _logoApp(context),
                  _email(),
                  _password(),
                  _botones(context)
                ],
                ),
            ),
          ),
      
    ),

  );
}

Widget _email(){

      const InputDecoration inputDecoration = InputDecoration(
  enabledBorder: const OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.white,
    ),
    borderRadius: BorderRadius.all( Radius.circular(30.0))

  ),
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
  contentPadding: EdgeInsets.symmetric(vertical: 14.0,horizontal: 10.0)
  
);


    return Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
        Text('Ingrese su correo',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white)),
        SizedBox(height: 10.0,),
        TextFormField(
          decoration: inputDecoration.copyWith(
          ),
          keyboardType: TextInputType.emailAddress ,
           validator: (String value){
             if(value.isEmpty){
               return 'Campo email es requerido';
             }
           },
           onSaved: (String value){
             email = value;
             print(value+" email:"+email);
           },

        ),
                ],
              ),
              )
          ],
        ),

      );


  }

Widget _password(){

    const InputDecoration inputDecoration = InputDecoration(
  enabledBorder: const OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.white,
    ),
    borderRadius: BorderRadius.all( Radius.circular(30.0))

  ),
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
  contentPadding: EdgeInsets.symmetric(vertical: 14.0,horizontal: 10.0)
  
);


    return SafeArea(
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
        Text('Ingrese su contraseña',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white)),
        SizedBox(height: 10.0,),
        TextFormField(
          obscureText: true,
          decoration: inputDecoration.copyWith(
          ),
         
           validator: (String value){
             if(value.isEmpty){
               return 'Campo contraseña es requerido';
             }
           },
           onSaved: (String value){
             password = value;
           },
           onChanged: (_email){
            
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

Widget _botones(BuildContext context){

    return Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 30.0),
            child: Row(
            verticalDirection: VerticalDirection.up,
              
              children: <Widget>[
                
                FlatButton(onPressed: (){         

   if(!_formkey.currentState.validate()){
     return;
   }

   _formkey.currentState.save();

   _accesLogin();

                            },
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            color: Colors.white,
                            child: Padding(
                               padding: EdgeInsets.symmetric(horizontal: 9.5,vertical: 5.0),
                             child: Text('INGRESAR', style: TextStyle(fontSize: 13.0,color: Colors.black))
                               ),
                            ),
                           
                            
                             FlatButton(
                            onPressed: (){
                             
                            },
                            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            
                           
                             child: Text('OLVIDE MI CONTRASEÑA', style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold,color: Colors.white))
                               
                            ),

             
              ],
            ),
          ),
    );

}

void _accesLogin() async {
  
    await usuario.login(email, password, context);

    SessionManagement session =new  SessionManagement();

    bool sesionUser = await session.getSession();

    if(sesionUser != true){

      showDialog(context: context,
      builder: (_)=> new AlertDialog(
        title:Text("Error"),
        content: Text("Correo/contraseña incorrecto"),
        actions: <Widget>[
          FlatButton(
            onPressed: () { 
              Navigator.pop(context);
              },
            child: Text("Intentar de nuevo"))
        ],
      ));
     

    }else{
      
       print(_sessionManag.getIdUsuario());
       Navigator.pushReplacementNamed(context,"mapMedico");
    
    }
}

}
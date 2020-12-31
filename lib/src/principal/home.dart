import 'package:flutter/material.dart';
import 'package:wecare_medics_ios/src/models/genero_model.dart';
import 'package:wecare_medics_ios/src/principal/login.dart';
import 'package:wecare_medics_ios/src/principal/registro.dart';
import 'package:wecare_medics_ios/src/provider/genero_provider.dart';

class HomePage  extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<GeneroModel> _genero;
  final generosProvider = new GenerosProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          _logoApp(context),
          _botonesApp(context),


        ],

      ),
    );
  }

  Widget _fondoApp(){
      return Container(
        decoration: BoxDecoration(
          image:DecorationImage(
             image:AssetImage('asset/inicial.png'),
             fit: BoxFit.cover,
            ),
        ) ,
        child: null,

      );
  }

  Widget _logoApp(BuildContext context){

    final orientation = MediaQuery.of(context);

 return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
            child: Column(
              children: [
                Image.asset(
                    'asset/logoBlanco.png',
                    alignment: Alignment.center,
                    width: orientation.orientation == Orientation.portrait? 200.0:150,
                    height:  orientation.orientation == Orientation.portrait? 300.0:200.0,
                    ),
              ],
            ),
            ),
          ],
        ),
      ),
      
 );

  }

  Widget _botonesApp(BuildContext context){

    return  SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 30.0),
            child: Column(
            verticalDirection: VerticalDirection.up,
              
              children: <Widget>[
                
                FlatButton(
                            onPressed: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                            },
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            color: Colors.white,
                            child: Padding(
                               padding: EdgeInsets.symmetric(horizontal: 70.0,vertical: 5.0),
                             child: Text('Entrar', style: TextStyle(fontSize: 14.0,color: Colors.blue[300]))
                               ),
                            ),
                           
                            
                             FlatButton(
                            onPressed: (){
                             
                            },
                            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            
                           
                             child: Text('Olvide mi contraseña', style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold,color: Colors.white))
                               
                            ),

                             FlatButton(
                           
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            color: Colors.white,
                            child: Padding(
                               padding: EdgeInsets.symmetric(horizontal: 50.0,vertical: 0.0),
                             child: Text('Registrarme', style: TextStyle(fontSize: 14.0,color: Colors.blue[300]))
                               ),
                                onPressed: (){  
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistroPage()));
                                },
                            ),
             
              ],
            ),
          ),
    );

  }

}


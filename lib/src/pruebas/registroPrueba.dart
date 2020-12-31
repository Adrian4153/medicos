import 'package:flutter/material.dart';
import 'package:wecare_medics_ios/src/models/genero_model.dart';
import 'package:wecare_medics_ios/src/provider/genero_provider.dart';

class RegistroPruebaPage extends StatelessWidget {

   final GeneroModel generoM = new GeneroModel();
   final GenerosProvider generoP = new GenerosProvider();
   final formkey = GlobalKey<FormState>();

   String nomGenero;
   String estatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro prueba'),
      ) ,
      body: Container(
        child: _formRegistro(),
      )
    );
  }

  Widget _formRegistro(){

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: Container(

        child: Form(
          key: formkey,
          child:Column(
          children: <Widget>[
           _nombreGenero(),
           SizedBox(height: 10.0),
           _estatusGenero(),
           _botones()
          ],
          ),
        ),
      ),
    );
  }

  Widget _nombreGenero(){
    return  TextFormField(
              decoration: InputDecoration(
                labelText: 'Genero',
                hintText: 'Escribe el nombre del genero',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                )
              ),
              onSaved: (value){
               nomGenero = value;
              },
            );
            
  }
   Widget _estatusGenero(){
    return  TextFormField(
              decoration: InputDecoration(
                labelText: 'Estatus',
                hintText: 'Escribe el estatus del genero',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                )
              ),
              onSaved: (value){
                estatus = value;
              },
            );
  }

  Widget _botones(){

    return FlatButton(
      
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
     color: Colors.grey,
                                 
     padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 0.0),
     child: Text('Registrar', style: TextStyle(fontSize: 14.0,color: Colors.white)),
      onPressed: (){

        formkey.currentState.save();

        generoM.genero=nomGenero;
        generoM.estatus=estatus;
        
        generoP.crearGenero(generoM);

      },
      );

  }

}
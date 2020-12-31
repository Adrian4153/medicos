
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wecare_medics_ios/src/principal/perfil.dart';


class MapMedic extends StatefulWidget {
  @override
  _MapMedicState createState() => _MapMedicState();
}

class _MapMedicState extends State<MapMedic> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

 Icon cusIcon =Icon(Icons.search);
 Widget cusSearchBar = Text("Médico");

 static const InputDecoration inputDecoration = InputDecoration(
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
  hintText: 'Buscar...',
  contentPadding: EdgeInsets.symmetric(vertical: 14.0,horizontal: 10.0),
 
  
);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context){
            return IconButton(
              icon: Image.asset('asset/logoBlanco.png'),
              onPressed:(){           
               scaffoldKey.currentState.showSnackBar(snackBar);
              }
              );
          },
          ),
         elevation: 1.0,
         centerTitle: true,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.vertical(
             bottom: Radius.circular(30.0)
           )
           ),
         title: cusSearchBar,
        actions: <Widget>[
          IconButton(
            icon: cusIcon,
            onPressed: (){
              setState(() {
                if(this.cusIcon.icon == Icons.search){
                  this.cusIcon = Icon(Icons.cancel);
                  this.cusSearchBar = TextField(
                    textInputAction: TextInputAction.go,
                    decoration: inputDecoration,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0
                    ),
                  );
                }else{
                  this.cusIcon =Icon(Icons.search);
                  this.cusSearchBar = Text("Médico");
                }
              });
            }
          ),
          IconButton(
            icon: Image.asset('asset/usuario.png'),
            tooltip: 'Show Snackbar',
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PerfilPage()));
              //scaffoldKey.currentState.showSnackBar(snackBar);
            }
          ),
        ],
        /*bottom: PreferredSize(
          preferredSize: Size(50, 50),
          child: Container(),
        ),*/
      

      ),
   
       body: _viewMapa(),

    );
  }

  Widget _viewMapa(){
    return  GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(20.6482277,-100.4034547),
        zoom:20, 
        )
      );

  
      }
      
  }

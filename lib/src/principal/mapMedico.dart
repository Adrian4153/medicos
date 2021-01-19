
import 'dart:async';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wecare_medics_ios/src/principal/perfil.dart';
import 'package:wecare_medics_ios/src/principal/solicitudServicio.dart';
import 'package:wecare_medics_ios/src/utilities/sessionManagement.dart';


class MapMedic extends StatefulWidget {
  @override
  _MapMedicState createState() => _MapMedicState();
}

class _MapMedicState extends State<MapMedic> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
final sesion = new SessionManagement();
 Icon cusIcon =Icon(Icons.search);
 Widget cusSearchBar = Text("Médico");

 Completer<GoogleMapController> _controller = Completer();

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

    print(sesion.getSession().toString());
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
                      color: Colors.blue,
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
   
       body: Stack(

           children: <Widget>[
             
              _viewMapa(context),
              _viewServicios(),
           ],
         ),

    );
  }

  Widget _viewMapa(BuildContext context){
    
    return  Container(
      width: MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.height,
      child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(20.6482277,-100.4034547),
              zoom:20, 
              ),
              onMapCreated: (GoogleMapController controller){
                _controller.complete(controller);
              },
            ),
            
    );
  
      }

      Widget _viewServicios(){

        return Align(
          alignment:  Alignment.bottomLeft,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 150.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                SizedBox(width: 10.0),
                 FlatButton(
                  child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _servicios("asset/solicitar_medico.png",
                  "Solicitar médico"),
                  ),
                              onPressed: () {
                                
                                //print("seleccionado");
                                Navigator.push(context,MaterialPageRoute(builder: (context)=> SolicitudServicioPage()));
                              },
                            ),
                 SizedBox(width: 10.0),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _servicios("asset/solicitar_enfermero.png",
                  "Enfermero"),
                  ),
                SizedBox(width: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _servicios("asset/farmacias.png",
                  "Farmacias"),
                  ),
                   SizedBox(width: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _servicios("asset/hospitales.png",
                  "Hospitales"),
                  ),
                   SizedBox(width: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _servicios("asset/agendar_solicitud.png",
                  "Agendar solicitud"),
                  ),
                   SizedBox(width: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _servicios("asset/historial_medico.png",
                  "Historial médico"),
                  ),
                   SizedBox(width: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _servicios("asset/seguridad.png",
                  "Seguridad en APP"),
                  ),
                   SizedBox(width: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _servicios("asset/emergencias.png",
                  "Emergencias"),
                  )
              ],
              ),
          ),
        );

      }

      Widget _servicios(String _image, String _nombre){

        
        return Container(

          child: FittedBox(
            child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Image.asset(
                          _image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                   Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _detallesServicios(_nombre),
                        ),
                    ),
                    
                ],
              ),
            ),
          ),

        );

      }

      Widget _detallesServicios(String nombreServicio) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(nombreServicio,
            style: TextStyle(
                color: Colors.blue,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height:5.0),
        Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "4.1",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStarHalf,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
               Container(
                  child: Text(
                "(946)",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
            ],
          )),
          SizedBox(height:5.0),
        Container(
                  child: Text(
                "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
              SizedBox(height:5.0),
        Container(
            child: Text(
          "Closed \u00B7 Opens 17:00 Thu",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  }

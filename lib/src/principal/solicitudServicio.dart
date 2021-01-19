
import 'dart:convert';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';


class SolicitudServicioPage extends StatefulWidget {
  @override
  _SolicitudServicioPage createState() => _SolicitudServicioPage();
}

class _SolicitudServicioPage extends State<SolicitudServicioPage> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  SharedPreferences prefs;
  String hora;
  String fecha;

  @override
  void initState() {
    super.initState();
     _selectedEvents = [];_controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
   
    initPrefs();
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString("events") ?? "{}")));
    });
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda de servicio'),
      ),
      body: Stack(
        children: <Widget>[
           _fondo(),_calendarServicios(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showAddDialog,
      ),
    );
  }

    static const InputDecoration inputDecoration = InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        fillColor: Colors.blue,
        icon: Icon(Icons.edit),
        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0));

  static const InputDecoration inputDecorationTime = InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        hintStyle: TextStyle(
          color: Colors.white,        
        ),
        fillColor: Colors.blue,
        hintText: "Selecciona hora",
        icon:Icon(Icons.access_time),
        contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0));


  _showAddDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Detalles"),
              content: Column(
                children: <Widget>[
                  Text("Título de cita",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,color: Colors.black
                  ),),
                  SizedBox(height: 10.0),
                  TextField(
                    decoration: inputDecoration.copyWith(),
                    controller: _eventController,
                  ),
                  SizedBox(height: 30.0),
                  Text("Seleccione la hora",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,color: Colors.black
                  ),),
                  SizedBox(height: 10.0),
                  DateTimePicker(
                      decoration: inputDecorationTime.copyWith(),
                      type: DateTimePickerType.time,
                      timeLabelText: "-------",
                      timeHintText: "------",
                      locale: const Locale('es', ""),
                      icon: Icon(Icons.access_time),
                      onChanged: (val) => hora = val,
                      validator: (val) {
                        hora = val;
                       
                        
                      },
                      onSaved: (String val) {
                        hora = val;
                       
                      },
                    ),
                   
                ],
              ),
              actions: <Widget>[
               
                FlatButton(
                  child: Text("Save"),
                  onPressed: () {
                    
                    if (_eventController.text.isEmpty) return;
                    

                    if (_events[_controller.selectedDay] != null) {
                      _events[_controller.selectedDay]
                          .add(hora);
                          print("primero:"+hora);
                    } else {
                      _events[_controller.selectedDay] = [
                        hora
                      ];
                      
                    }
                    prefs.setString("events", json.encode(encodeMap(_events)));
                    _eventController.clear();
                    Navigator.pop(context);
                  },
                )
              ],
            ));
    setState(() {
      _selectedEvents = _events[_controller.selectedDay];
    });
  }

  
  Widget _fondo(){

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('asset/inicial.png'), fit: BoxFit.cover),
      ),
    );
      
  }


 Widget _calendarServicios(BuildContext context){
return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              events: _events,
              initialCalendarFormat: CalendarFormat.month,
              locale: 'es',
              calendarStyle: CalendarStyle(
                  canEventMarkersOverflow: true,
                 selectedColor: Colors.white,
        todayColor: Colors.blue,
        markersColor: Colors.black,
        todayStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
          color: Colors.white
        ),),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
        formatButtonDecoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(22.0),
        ),
        formatButtonTextStyle: TextStyle(color: Colors.white),
        formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events,holidays) {
                setState(() {
                  _selectedEvents = events;
                });
              },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              calendarController: _controller,
            ),
            ..._selectedEvents.map((event) => ListTile(
                  title: Text(event),
                  onTap: () => print(event),
                )),
          ],
        ),
      );
  }
}

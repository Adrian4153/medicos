import 'package:shared_preferences/shared_preferences.dart';

class SessionManagement{

  SharedPreferences  _sharedPreferences;
  String shared_pref_name = "session";
  String session_key = "session_user";


   setIdUsuario(String value) async { 
    _sharedPreferences= await SharedPreferences.getInstance();
    print("setUsuario: "+value);
    _sharedPreferences.setString('idUsuario', value);
  }

  getIdUsuario() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    print("usuario:"+_sharedPreferences.getString("idUsuario"));
    String idUsuario="";
    idUsuario = _sharedPreferences.getString('idUsuario');
    return idUsuario;
  }

  setFolio(String value) async { 
    _sharedPreferences= await SharedPreferences.getInstance();
    print("setFolio: "+value);
    _sharedPreferences.setString('folio', value);
  }

  getFolio() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    print("getFolio: "+_sharedPreferences.getString('folio'));
    return _sharedPreferences.getString('folio');
  }

  setSession(bool value) async {
    _sharedPreferences = await SharedPreferences.getInstance();
   _sharedPreferences.setBool(session_key,value);
  }

    getSession() async {

  _sharedPreferences = await SharedPreferences.getInstance();

    bool session = false;

    session = _sharedPreferences.getBool(session_key);

    return session;

   }

   removeData() async {

     _sharedPreferences = await SharedPreferences.getInstance();
     await _sharedPreferences.clear();
    
   }

}

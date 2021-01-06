import 'package:http/http.dart' as http;
import 'package:wecare_medics_ios/src/models/registro_model.dart';
import 'package:wecare_medics_ios/src/utilities/utilities.dart';


class RegistroProvider{

  Utilities utilitiesObj = new Utilities();

  String _baseUrl = "";

  Future<bool> crearRegistro(RegistroModel registro)async{

    utilitiesObj.setPROD_TEST(false);

    _baseUrl = utilitiesObj.getBASE_URL();

    _baseUrl = '${_baseUrl}Empleados/create.php';

    final resp = await http.post(_baseUrl,body: registroModelToJson(registro));

    if(resp.statusCode == 200){

      print("Respuesta: insertado");
      return true;

    } else{
      return false;
    }



    

  }


}
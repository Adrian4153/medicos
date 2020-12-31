import 'package:http/http.dart' as http;
import 'package:wecare_medics_ios/src/models/registro_model.dart';
import 'package:wecare_medics_ios/src/utilities/utilities.dart';


class RegistroProvider{

  Utilities utilitiesObj = new Utilities();

  String _baseUrl = "";

  Future<bool> crearRegistro(RegistroModel registro)async{

    utilitiesObj.setPROD_TEST(false);

    _baseUrl = utilitiesObj.getBASE_URL();

    final baseUrl = '${_baseUrl}Empleados/create.php';

    

  }


}
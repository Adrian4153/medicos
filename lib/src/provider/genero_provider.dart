//Este archivo es el encargado de hacer las interacciones directas con la base de datos

import 'dart:convert';

import 'package:http/http.dart' as http;
//import 'package:mime_type/mime_type.dart';
//import 'package:http_parser/http_parser.dart';
import 'package:wecare_medics_ios/src/models/genero_model.dart';
import 'package:wecare_medics_ios/src/utilities/utilities.dart';

class GenerosProvider {
  //metodo crear producto por http

  Utilities utilitiesObj = new Utilities();

  final String _url = 'http://192.168.1.70:8080/flutter';
  String _base_url = "";

  Future<bool> crearGenero(GeneroModel genero) async {
    final url = '$_url/insertGenero.php';

    utilitiesObj.setPROD_TEST(false);

    _base_url = utilitiesObj.getBASE_URL();

/*
Una forma de mandar datos es mandando un mapa donde se especifique cada variable  que se va ocupar en el lado
del servidor
*/

    Map<String, dynamic> mapa = Map<String, dynamic>();

    mapa["genero"] = genero.genero;
    mapa["estatus"] = genero.estatus;
 
    final resp = await http.post(url, body: generoModelToJson(genero));

    if (resp.statusCode == 200) {
      print("Resp: " + resp.body);
      return true;
    } else {
      return false;
    }
  }

  //Listar productos por http
  Future<List<GeneroModel>> cargarGeneros() async {
    final url = '$_url/selectGeneros.php';
    final resp = await http.get(url);

    final List<dynamic> decodeData = json.decode(resp.body);

    final List<GeneroModel> generos = new List();

    if (decodeData == null) return [];

    decodeData.forEach((genero) {
      final prodTemp = GeneroModel.fromJson(genero);

      generos.add(prodTemp);
    });

    return generos;
  }

  //eliminar productos http
/*
    Future<int> borrarProducto(String id) async{

      final url = '$_url/productos/$id.json';

      final resp = await http.delete(url);

      print(json.decode(resp.body));


      return 1;


    }

    //Editar producto por http

    
  Future<bool>editarProducto(ProductoModel producto) async {


    final url = '$_url/productos/${producto.id}.json';

    final resp = await http.put(url, body: productoModelToJson(producto));

    final decodeData = json.decode(resp.body);

    print(decodeData);

    return true;
  
  }


//subir imagen
  Future<String> subirImagen(File imagen) async {

    final url = Uri.parse('https://api.cloudinary.com/v1_1/db0mfne6a/image/upload?upload_preset=ytyfrwpo');
    final mimeType = mime(imagen.path).split('/'); //image.jpeg,png, etc

    final imageUploadRequest = http.MultipartRequest(

      'POST',
      url

    );

    final file = await http.MultipartFile.fromPath(
      'file',
       imagen.path,
       contentType: MediaType( mimeType[0], mimeType[1] )

      );

  imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();

    final resp = await http.Response.fromStream(streamResponse);

    if( resp.statusCode != 200 && resp.statusCode != 201){
      print('Algo salio mal');
      print(resp.body);
      return null;
    }

    final respData = json.decode(resp.body);

    print(respData);

    return respData['secure_url'];


  }*/

}

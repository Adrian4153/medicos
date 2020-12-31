

class Utilities{

  static final String _BASE_URL = "https://we-care.com.mx/ApiWeCare/CRUD/";
  static final String _BASE_URL_TEST = "https://we-care.com.mx/ApiWeCare2/CRUD/";
  static final String _BASE_URL_UPLOAD = "https://we-care.com.mx/ApiWeCare/";
  static final String _BASE_URL_UPLOAD_TEST = "https://we-care.com.mx/ApiWeCare2/";

  bool _PROD_TEST;
 
  void setPROD_TEST(bool PROD_TEST){

    this._PROD_TEST = PROD_TEST;
    
  }

  bool getPROD_TEST(){

    return this._PROD_TEST;

  }

  String getBASE_URL(){

    return ( _PROD_TEST == true ) ? _BASE_URL : _BASE_URL_TEST;

  }

   String getUploadURL(){

     return ( _PROD_TEST == true ) ? _BASE_URL_UPLOAD : _BASE_URL_UPLOAD_TEST;

   }

 

}
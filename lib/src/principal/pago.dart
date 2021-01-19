import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wecare_medics_ios/src/utilities/sessionManagement.dart';



class PagoPage extends StatefulWidget {

  @override
  _PagoPageState createState() => _PagoPageState();
}

class _PagoPageState extends State<PagoPage> {
  SessionManagement _session = new SessionManagement();
  String idUsuario;

  @override
  void initState() { 
    super.initState();
    
    checkSession();
    
    
  }

 void checkSession() async {
final us = await  _session.getIdUsuario();

    setState(() {
      idUsuario = us;
    });

  
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Pago')),
      body: WebView(
        initialUrl: "https://we-care.com.mx/ApiWeCare2/Paginas/Pagos/index.html?idUsuario="+idUsuario,
        javascriptMode: JavascriptMode.unrestricted,
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:wecare_medics_ios/src/models/genero_model.dart';
import 'package:wecare_medics_ios/src/provider/genero_provider.dart';

class PruebaPage extends StatelessWidget {
  final generosProvider = new GenerosProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prueba"),
      ),
      body: FutureBuilder(
          future: generosProvider.cargarGeneros(),
          builder: (BuildContext context,
              AsyncSnapshot<List<GeneroModel>> snapshot) {
            if (snapshot.hasData) {
              final generos = snapshot.data;

              return ListView.builder(
                itemCount: generos.length,
                itemBuilder: (context, i) => _crearItem(context, generos[i]),
              );
            } else {
              print("no carga");
              return Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: _floatingRegistro(context),
    );
  }

  Widget _crearItem(BuildContext context, GeneroModel genero) {
    return Card(
      child: Column(
        children: <Widget>[
// si es null pinta con la imagen de no-image

          ListTile(
            title: Text('${genero.idGenero} - ${genero.genero}'),
            subtitle: Text(genero.genero),
            onTap: () =>
                Navigator.pushNamed(context, 'producto', arguments: genero),
          ),
        ],
      ),
    );
  }

  Widget _floatingRegistro(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () => Navigator.pushNamed(context, 'registroPrueba'));
  }
}

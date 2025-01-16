import 'package:flutter/material.dart';
import '../modelo/clima_modelo.dart';
import '../controlador/clima_controlador.dart';
import 'clima_widget.dart';

class ClimaVista extends StatefulWidget {
  @override
  ClimaVistaState createState() => ClimaVistaState();
}

class ClimaVistaState extends State<ClimaVista> {
  final TextEditingController ciudadC = TextEditingController();
  final ClimaControlador climaC = ClimaControlador();
  ClimaModelo? climaModelo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clima'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: ciudadC,
              decoration: InputDecoration(
                hintText: 'Ingrese la ciudad',
                suffixIcon: IconButton(
                  onPressed: () {
                    ciudadC.clear();
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final clima = await climaC.obtenerClima(ciudadC.text);
                setState(() {
                  climaModelo = clima;
                });
              },
              child: Text('Obtener Clima'),
            ),
            if (climaModelo != null)
              ClimaWidget(
                ciudad: climaModelo!.ciudad,
                temperatura: climaModelo!.temperatura,
                descipcion: climaModelo!.descripcion,
              ),
          ],
        ),
      ),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AgregarEvento extends StatefulWidget{
  const AgregarEvento({super.key, required this.title});
  final String title;

  @override
  State<AgregarEvento> createState() => _AgregarEventoState();
}

class _AgregarEventoState extends State<AgregarEvento>{
  TextEditingController _nombreTEC = TextEditingController();
  TextEditingController _inicioTEC = TextEditingController();
  TextEditingController _finTEC = TextEditingController();
  TextEditingController _colorTEC = TextEditingController();

  Color _colorCP = Colors.orangeAccent; //variable para color

  final db = FirebaseFirestore.instance;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  @override
  void initState() {  // Obtiene el nombre para poder cargarlo antes de todo
    super.initState();
  }

  Future<void> _cargarDatos() async{
    String nombre = _nombreTEC.text;
    DateTime inicioDT = DateTime.parse(_inicioTEC.text);
    DateTime finDT = DateTime.parse(_finTEC.text);
    int color = int.parse(_colorTEC.text);

    final inicio = Timestamp((inicioDT.millisecondsSinceEpoch/1000 as int), 0);
    final fin = Timestamp((finDT.millisecondsSinceEpoch/1000 as int), 0);

    Map<String, dynamic> datos = {
      "Nombre":nombre,
      "Inicio":inicio,
      "Fin":fin,
      "Color":color,
    };
    await db.collection("calendario").doc(nombre).set(datos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              child: TextField(
                controller: _nombreTEC,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              child: TextField(
                controller: _inicioTEC,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Inicio',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              child: TextField(
                controller: _finTEC,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Fin',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              child: TextField(
                controller: _colorTEC,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Color',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
                onPressed: (){
                  _cargarDatos();
                },
                color: Theme.of(context).colorScheme.inversePrimary,
                child: const Text(
                  "Agregar Evento",
                  style: TextStyle(fontSize: 18),
                ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bienvenido extends StatefulWidget{
  const Bienvenido({super.key, required this.title});
  final String title;

  @override
  State<Bienvenido> createState() => _BienvenidoState();
}

class _BienvenidoState extends State<Bienvenido>{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _mensaje= "Bienvenida";
  String _nombre = "";

  Future<void> _getNombre() async{
    final SharedPreferences prefs = await _prefs;
    if(prefs != Null){
      setState(() {
        _nombre = (prefs.getString("nombre") ?? ""); // ?? -> es como un if chiquito, si es nulo se escribe lo de la izq, sino lo de la der
        _mensaje  = "Bienvenido $_nombre";
      });
    }
  }

  @override
  void initState() {  // Obtiene el nombre para poder cargarlo antes de todo
    super.initState();
    _getNombre();
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
            /*const SizedBox( // espacio
              height: 20,
              width: 20,
            ),*/
             Text( // texto bienvenido
               _mensaje,
              style: TextStyle(fontSize: 40),
            ),
            /*const SizedBox( // espacio
              height: 20,
              width: 20,
            ),*/
            /*Text( // datos introducidos por el usuario
              _usuario,
              style: TextStyle(fontSize: 35,
                color: Colors.brown,
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
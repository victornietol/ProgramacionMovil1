import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

class Ingresar extends StatefulWidget{
  const Ingresar({super.key, required this.title, required this.home}); // son las variables requeridas
  final Function home;
  final String title;

  @override
  State<Ingresar> createState() => _IngresarState();
}

class _IngresarState extends State<Ingresar>{
  TextEditingController _textEditingController = TextEditingController(); // controla lo que se va a escribir en el textField
  final Future<SharedPreferences> _prefs =  SharedPreferences.getInstance();  //Se va a construir con un delay hasta que el dispositivo la cree

  Future<void> _guardarNombre() async{ // va a guardar el nombre en la memoria de la aplicacion. Al ser una funcion futura se le debe asignar async
    final SharedPreferences prefs = await _prefs;  // await indica que se debe esperar a que haya algo en _prefs para guardarlo en prefs
    if(prefs != Null) {
      prefs.setString('nombre', _textEditingController.text);  //primer nombre
      setState(() {
        _textEditingController.text = "";
      });
    }
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container( // caja para introducir texto
                  width: 250,
                  height: 50,
                  child: TextField(
                    onSubmitted: (value) {
                      _guardarNombre();
                      widget.home(0); // es home porque asi se le puso arribla a la funcion y afecta al widget padre
                    },
                    controller: _textEditingController,
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Ingresa nombre",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                  width: 10,
                ),
                Container( // boton de enviar
                  width: 150,
                  height: 50,
                  child: ElevatedButton.icon( // se pone .icon para indicar que lleva icono, si no se pone icon solo va el nombre del widget
                      onPressed: () {
                        _guardarNombre();
                        widget.home(0);
                      },
                      icon: Icon(Icons.send),
                      label: const Text("Enviar",
                            style: TextStyle(fontSize: 18),
                      ),
                      style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber),
                      ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ), // ahora el cuerpo se maneja asi (sus ajustes desde arriba), dependiendo del indice es la pagina que se muestra por la lista

    );
  }
}
//import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

// AQUI SE MODIFICA EL CONTENIDO DE LA APLICACION
class Contador extends StatefulWidget {
  const Contador({super.key, required this.title});

  final String title;  // la variable tipo Final es un tipo que no se va a cambiar

  @override
  State<Contador> createState() => _ContadorState(); // guion bajo ayuda a encontrar mas facilmente los estados. Los hace privados
}

class _ContadorState extends State<Contador> {
  final db = FirebaseFirestore.instance;
  int _counter = 0;


  @override
  void initState() {
    _leerDatos();
  }

  void _escribeDatos() async {
    await db.collection("numeros").doc("n0").set({"contador":_counter});  // aqui escribe en la BD
  }


  void _leerDatos() async {
    await db.collection("numeros").doc("n0").get().then((documento) { // siempre se hace referencia como si fuera un string
      setState(() {
        _counter = documento.get("contador");
      });
    });
  }




  void _incrementCounter() {
    setState(() {   // ayuda a recargar los valores (solo se hace en flutter). Ayuda a mostrar los resultados de la variabele realmente
      _counter++;
      // se puede utilizar print para debuguear
      // print(_counter);

    });
    _escribeDatos(); // solo escribe en la base de datos
  }

  // Agregando funcion del boton de resta
  void _btnDecrementar() {
    setState(() {   // ayuda a recargar los valores (solo se hace en flutter). Ayuda a mostrar los resultados de la variabele realmente
      _counter--;
      // se puede utilizar print para debuguear
      // print(_counter);
    });
    _escribeDatos();
  }

  @override
  Widget build(BuildContext context) {  //Aqui se modifican los widgets de la aplicacion, (estan widgets dentro de widgets referente a la estructura)
    // Scaffold y floattingActionButton se quedan fijos (como superpuestos) sin importar a donde movamos la pantalla. (ImgPW1)
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title), // Aqui tambien se puede cambiar el texto de la aplicacion (titulo), pero es mejor manejarlo desde afuera (arriba)
      ),
      body: Center(
        // Ajusta la posicion de los widgets
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ // children puede recibir una lista de elementos, pero hay que indicar el tipo de elemnto que son. Se separan por comas los elementos
            const Text( // Es importante indicar que variables constantes y cuales se van a almacenar en memoria para ayudar al tema de optimizacion. (Este es un widget constante en esta ocasion)
              'Veces que has presionado el boton:',
              //textScaler: TextScaler.linear(5),
              style: TextStyle(fontSize: 60),  // Se agrego para cambiar el tamaño del texto
            ),
            Text( // este widget no es constante como el anterior
              '$_counter',  // tiene el signo de pesos para que la variable sea una variable y no lo cambie a un texto
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton:
      Column(
        mainAxisAlignment: MainAxisAlignment.end,  // Alineacion del texto
        children: <Widget>[  // Lista de widgets
          //  Boton de incremento
          FloatingActionButton(
            backgroundColor: Colors.green, // Se agrego para cambiar el color del boton (tambien se puede construir un color con valores)
            onPressed: _incrementCounter,
            tooltip: 'Incrementar en 1',  // dice que hace el boton
            child: const Icon(Icons.exposure_plus_1_outlined), // Aqui se puede cambiar el tipo de icono. (Utilizar ctrl + espacio)
          ),

          // Se crea un box para utilizarlo como espaciador entre los dos botones
          const SizedBox(
            height: 15,
            width: 10,
          ),

          // Boton de decremento
          FloatingActionButton(
            backgroundColor: Colors.red, // Se agrego para cambiar el color del boton (tambien se puede construir un color con valores)
            onPressed: _btnDecrementar,
            tooltip: 'Decrementar en 1',  // dice que hace el boton
            child: const Icon(Icons.exposure_minus_1_outlined), // Aqui se puede cambiar el tipo de icono. (Utilizar ctrl + espacio)
          ),
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.



    );
  }
}
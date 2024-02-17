import 'package:clase2857/app.dart';
import 'package:flutter/material.dart';

// aqui contiene las librerias necesarias
void main() {
  runApp(const MyPrimeraApp());  // aqui se ejecuta la aplicacion . aqui se le puede cambiar el nombre a la clase principal de la aplicacion
}

/*  Se fue a app.dart
class MyPrimeraApp extends StatelessWidget {
  const MyPrimeraApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {   // Aqui se crea el cascaron o hueco para la aplicacion
    return MaterialApp(
      title: 'Titulo Prueba',
      theme: ThemeData(
        // aplicacion del tema de la aplicacion
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber), // cambiar el esquema de color en todos objetos que lo llamen
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Programando una aplicacion'),
    );
  }
}*/


/* Esto se movio a doritod
// AQUI SE MODIFICA EL CONTENIDO DE LA APLICACION
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;  // la variable tipo Final es un tipo que no se va a cambiar

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // guion bajo ayuda a encontrar mas facilmente los estados. Los hace privados
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {   // ayuda a recargar los valores (solo se hace en flutter). Ayuda a mostrar los resultados de la variabele realmente
      _counter++;
      // se puede utilizar print para debuguear
      // print(_counter);

    });
  }

  // Agregando funcion del boton de resta
  void _btnDecrementar() {
    setState(() {   // ayuda a recargar los valores (solo se hace en flutter). Ayuda a mostrar los resultados de la variabele realmente
      _counter--;
      // se puede utilizar print para debuguear
      // print(_counter);
    });
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


 */

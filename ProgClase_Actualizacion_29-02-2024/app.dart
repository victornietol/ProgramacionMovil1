//import "package:clase2857/Vistas/cal.dart";
//import "package:clase2857/Vistas/doritos.dart";
import "package:clase2857/navegador.dart";
import "package:flutter/material.dart";

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
      home: const Navegador(), //title: 'Programando una aplicacion'), // Aqui se cambia que pagina se va a mostrar
    );
  }
}
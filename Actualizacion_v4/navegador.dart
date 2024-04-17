import 'package:clase2857/Vistas/agregarEvento.dart';
import 'package:clase2857/Vistas/bienvenido.dart';
import 'package:clase2857/Vistas/cal.dart';
import 'package:clase2857/Vistas/calend.dart';
import 'package:clase2857/Vistas/doritos.dart';
import 'package:clase2857/Vistas/imagenes.dart';
import 'package:clase2857/Vistas/ingresar.dart';
import 'package:clase2857/Vistas/pantallaCarga.dart';
import 'package:flutter/material.dart';
import 'package:clase2857/Vistas/geo.dart';

class Navegador extends StatefulWidget{
  const Navegador({super.key});

  @override
  State<Navegador> createState() => _NavegadorState();
}

class _NavegadorState extends State<Navegador>{
    int _indice = 0; // sirve para controlar el indice la pagina a mostrar
    final _cuerpo = [  // se hace una lista para manejar que pagina se va a poner (calculadora,etc)
      /*
      const AgregarEvento( // se quito porque ya no se usa asi
        title: "Yo soy el cuerpo del nuevo evento",
      ),*/
      /*Ingresar( // se pone "final" porque no va a cambiar con el tiempo . es el contador (cambiar el nombre de MyHomePage
        title: "Yo soy el ingreso",
        home: home,
      ),*/
    ];

    void _home(int n) {
      setState(() {
        _indice = n;
        print("Se actualzo a $_indice");
      });
    }

  @override
  void initState(){
      super.initState();
      _cuerpo.add(
        const Bienvenido(
          title: "Yo soy el cuerpo de bienvenido",
        ),
      );
      _cuerpo.add(
        const Calculadora( // se pone "final" porque no va a cambiar con el tiempo
          title: "Yo soy el cuerpo de la calculadora",
        ),
      );
      _cuerpo.add(
        const Contador( // se pone "final" porque no va a cambiar con el tiempo . es el contador (cambiar el nombre de MyHomePage
          title: "Yo soy el cuerpo del contador",
        ),
      );
      _cuerpo.add(
        const Geo( // se pone "final" porque no va a cambiar con el tiempo . es el contador (cambiar el nombre de MyHomePage
          title: "Yo soy el cuerpo del localizacion",
        ),
      );
      _cuerpo.add(
        Ingresar( // se pone "final" porque no va a cambiar con el tiempo . es el contador (cambiar el nombre de MyHomePage
          title: "Yo soy el ingreso",
          home: _home,
        ),
      );
      _cuerpo.add(
        Calendario( // se pone "final" porque no va a cambiar con el tiempo . es el contador (cambiar el nombre de MyHomePage
          title: "Yo soy el cuerpo del calendario",
          vista: _home,
        ),
      );
      _cuerpo.add(
        const Imagenes( // se pone "final" porque no va a cambiar con el tiempo . es el contador (cambiar el nombre de MyHomePage
          title: "Yo soy el cuerpo de Imagenes",
        ),
      );

      /*
      _cuerpo.add( // Pantalla de carga que solo se muestra cuando se requiere
        PantallaCarga(),
      );
      */
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _cuerpo[_indice], // ahora el cuerpo se maneja asi (sus ajustes desde arriba), dependiendo del indice es la pagina que se muestra por la lista
      bottomNavigationBar: BottomNavigationBar( //sirve para controlar el indice
        type: BottomNavigationBarType.fixed,
        currentIndex: _indice, // Cambia el color del boton seleccionado
        onTap: (value) {
          setState(() { // siempre se pone el setState cuando se vaya a cambiar el valor de una variable para que se vea reflejado el cambio
            _indice = value; // determinar que pantalla se va a mostrar dependiendo del boton que presiona el usuario
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label:  "Calculadora",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label:  "Contador",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_history),
            label:  "Geolocalizacion",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label:  "Ingresar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label:  "Calendario",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label:  "Imagen",
          ),

          /*
          BottomNavigationBarItem(  // Pestaña para hacer pruebas, solo se muestra para las pruebas
            icon: Icon(Icons.crisis_alert_outlined),
            label:  "Pruebas",
          ),
          */
        ],
      ) ,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';

class Geo extends StatefulWidget{
  const Geo({super.key, required this.title});
  final String title;

  @override
  State<Geo> createState() => _GeoState();
}

class _GeoState extends State<Geo>{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _lat= "";
  String _long = "";
  late Position _ubicacion;

  Future<Position> _obtenerUbicacion() async{
    bool servicioHabilitado; // indica si el servicio esta habilitado
    LocationPermission permiso; // para saber si el servicio esta denegado o no

    servicioHabilitado = await Geolocator.isLocationServiceEnabled(); // filtro para saber si el servicio esta habilitado
    if(!servicioHabilitado){
      return Future.error("Los servicio de ubicacion esta deshabilitados");
    }

    permiso = await Geolocator.checkPermission(); // checar si hay permiso
    if(permiso == LocationPermission.denied){
      permiso = await Geolocator.requestPermission(); // si no se tiene permiso se pide
      if(permiso == LocationPermission.denied){
        return Future.error("El permiso de ubicacion fue denegado");
      }
    }
    if(permiso == LocationPermission.deniedForever){ // si los servicios son denegados por siempre
      return Future.error("Los permisos estan denegados para siempre");
    }

    return await Geolocator.getCurrentPosition();
  }

  void _botonPresionado() async {
    _ubicacion = await _obtenerUbicacion();
    setState(() {
      _lat = _ubicacion.latitude.toString(); // pasar la latitud a string
      _long = _ubicacion.longitude.toString(); // pasar la longitud a string
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text( // texto bienvenido
          "longitud: $_lat",
          style: const TextStyle(fontSize: 15),
          ),
          Text( // texto bienvenido
            "longitud: $_long",
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 50,
          ),
          MaterialButton(
            color: Theme.of(context).colorScheme.inversePrimary,
              onPressed: (){
                _botonPresionado();
              },
            child: const Text(
              "Obtener localizacion",
            ),
          ),
          ],
        ),
      ),
    );
  }
}
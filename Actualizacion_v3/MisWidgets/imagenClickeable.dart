import 'package:flutter/material.dart';

class imagenClickeable extends StatefulWidget {
  const imagenClickeable({super.key, required this.alto, required this.ancho, required this.ruta, required this.accion});
  final int alto, ancho;
  final String ruta;
  final Function accion;

  @override
  State<imagenClickeable> createState() => _imagenClickeable();
}

class _imagenClickeable extends State<imagenClickeable> {

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: widget.ancho.toDouble(),  // asi se manda llamar las variables del widget mayor
      height: widget.alto.toDouble(),
      child: MaterialButton(
        onPressed: () => widget.accion(),
        child: Image.asset(widget.ruta),  // Asi se hace un boton para la imagen
      ),
    );
  }
}
import 'package:flutter/material.dart';

// Widget de Lista de imagenes
class ListaImagen extends StatefulWidget {
  const ListaImagen({super.key, required this.rutas, required this.descripciones});
  final List<String> rutas;
  final List<String> descripciones;

  @override
  State<ListaImagen> createState() => _ListaImagenState();
}

class _ListaImagenState extends State<ListaImagen> {

  List<Widget> LosWidgets = []; // lista para crear los widgets
  //List<String> r=[];
  //List<String> d=[];

  @override
  void initState(){
    super.initState();
    crearWidget();
  }

  void crearWidget() {
    for(int i=0; i<widget.rutas.length; i++) {
      LosWidgets.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(widget.rutas[i]),
            SizedBox(
              height: 20,
            ),
            Text(widget.descripciones[i]),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: LosWidgets,
    );
  }
}






// Widget de imagen clickeable
class imagenClickeable extends StatefulWidget {
  const imagenClickeable({super.key, required this.alto, required this.ancho, required this.ruta, required this.accion});
  final int alto, ancho;
  final String ruta;
  final Function accion;

  @override
  State<imagenClickeable> createState() => _imagenClickeableState();
}

class _imagenClickeableState extends State<imagenClickeable> {

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
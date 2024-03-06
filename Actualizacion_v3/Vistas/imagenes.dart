import "package:flutter/material.dart";
import 'package:clase2857/MisWidgets/imagenClickeable.dart';

class Imagenes extends StatefulWidget {
  const Imagenes({super.key, required this.title});

  final String title;  // la variable tipo Final es un tipo que no se va a cambiar

  @override
  State<Imagenes> createState() => _ImagenesState(); // guion bajo ayuda a encontrar mas facilmente los estados. Los hace privados
}

class _ImagenesState extends State<Imagenes> {

  @override
  Widget build(BuildContext context) {
    // Scaffold y floattingActionButton se quedan fijos (como superpuestos) sin importar a donde movamos la pantalla. (ImgPW1)
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView( // asi se hace una lista para acomodar los objetos
        children: [
          Column(  // Dependiendo de si es row o column se van a acomodar las imagenes
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*
              SizedBox(
                child: MaterialButton(
                  child: Image.asset("gato/gato1.jpg"),  // Asi se hace un boton para la imagen
                  onPressed: (){
                    print("Se presiono el gato 1");
                  },
                ),
                //child: Image.asset("gato/gato1.jpg"), // asi se pone una imagen en un widget
                height: 400, // con esto se maneja el tamaño de la imagen, trata de mantener la relacion del aspecto debido al SizedBox
              ),*/

              imagenClickeable(
                alto:400,
                ancho:400,
                ruta: "gato/gato1.jpg",
                accion:(){
                  print("Se presiono el gato 1");
                },
              ),

              SizedBox(
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRB7czOHKNvpYLWY6MY7S-J8O9fCv1XnEpbGg"), // asi se hace desde una direccion web
                width: 400,
              )

            ],
          ),
        ],
      )
    );
  }


}

// ASI SE CONSTRUYE UN WIDGET
/*
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
*/
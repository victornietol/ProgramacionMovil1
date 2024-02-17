import "package:flutter/material.dart";

class Calculadora extends StatefulWidget {
  const Calculadora({super.key, required this.title});

  final String title;

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {

  String _textPantalla = "0"; // solo se utiliza para mostrar en pantalla
  String _operador = "";
  double _trab = 0; // memoria de trabajo (se muestra el tecleo)
  double _memTotal = 0; // almacena la operacion total (solo muestra el resultado final cuando se ponga igual)
  bool _hayPunto = false;

  void _borrarTodo() { // Pone en cero la pantalla de la calculadora
    _hayPunto = false;
    _memTotal = 0;
    setState(() {
      _textPantalla = "0";
      _operador = "";
    });
  }

  void _borrarUno() { // borrar un digito
    if(_textPantalla != "0" && _operador != "=") { // cuando hay algo que borrar
      setState(() {
        if(_textPantalla.endsWith(".") && _textPantalla.length>1) { // cuando se borra un punto flotante
          _hayPunto = false;
          _textPantalla = _textPantalla.substring(0,_textPantalla.length -1);
        } else if (_textPantalla.length == 1) { // cuando solo hay un digito
          _textPantalla = "0";
        } else { // cuando hay mas de un digito
          _textPantalla = _textPantalla.substring(0,_textPantalla.length -1);
        }
      });
    } else if(_textPantalla == "0") { // cuando es cero
      // no hace nada
    }
  }

  void _presionarNumero(int n) {  // Mostrar numero en la pantalla de la calculadora
    String nStr = n.toString();
    setState(() {
      if(_textPantalla == "0"){ // si es el primer numero
        _textPantalla = nStr;
      } else {
        _textPantalla = _textPantalla + nStr;
      }
    });
  }

  void _presionarPunto() { // Agregar decimal
    if(_hayPunto == false) {
      _hayPunto = true;
      setState(() {
        _textPantalla = _textPantalla + ".";
      });
    } else {
      // no agrega nada si ya existe punto
    }


    //String strTrab = _trab.toString();
    //strTrab = strTrab.substring(0,strTrab.length);
    //strTrab = strTrab + ".";
    //print(strTrab);


    //String ejem = "hola.";
    //print(ejem.endsWith("."));
    //double ejem1 = 2.0;
    //double res = ejem1*1.1;
    //print("numero $ejem1");
    //if(ejem.endsWith("a")){}

  }

  void _resultado() {
    //_trab = double.parse(_textPantalla);
    if(_operador == "*") { // si es multiplicacion
      _trab = double.parse(_textPantalla);
      _memTotal = _memTotal * _trab;
      //print("Memoria multi $_memTotal");
    } else if(_operador == "+") {
      _trab = double.parse(_textPantalla);
      _memTotal = _memTotal + _trab;
    } else if(_operador == "-") {
      _trab = double.parse(_textPantalla);
      _memTotal = _memTotal - _trab;
    } else if(_operador == "/") {
      _trab = double.parse(_textPantalla);
      _memTotal = _memTotal / _trab;
    } else if(_operador == "=") { // si no hay operacion (se repite el igual)
      // no hace nada
      //print("memoria igual $_memTotal");
    }
    setState(() {
      _operador = "=";
      _textPantalla = _memTotal.toString();
    });
    //print("memorial res $_memTotal");
    //_memTotal = 0;
  }

  void _division(){
    _trab = double.parse(_textPantalla);
    if(_memTotal == 0) {
      _memTotal = _trab;
    } else if (_memTotal!=0 && _operador=="=" ){
      // no hace nada, espera la la operacion siguiente
    } else {
      _memTotal = _memTotal / _trab;
    }
    setState(() {
      _operador = "/";
      _textPantalla = " ";
      //_textPantalla = "0";
    });
  }

  void _multiplicar(){
    _trab = double.parse(_textPantalla);
    if(_memTotal == 0) {
      _memTotal = _trab;
    } else if (_memTotal!=0 && _operador=="=" ){
      // no hace nada, espera la la operacion siguiente
    } else {
      _memTotal = _memTotal * _trab;
    }
    setState(() {
      _operador = "*";
      _textPantalla = " ";
      //_textPantalla = "0";
    });
  }

  void _sumar() {
    _trab = double.parse(_textPantalla);
    if(_memTotal == 0) {
      _memTotal = _trab;
    } else if (_memTotal!=0 && _operador=="=" ){
      // no hace nada, espera la la operacion siguiente
    } else {
      _memTotal = _memTotal + _trab;
    }
    setState(() {
      _operador = "+";
      _textPantalla = " ";
      //_textPantalla = "0";
    });
  }

  void _restar() {
    _trab = double.parse(_textPantalla);
    if(_memTotal == 0) {
      _memTotal = _trab;
    } else if (_memTotal!=0 && _operador=="=" ){
      // no hace nada, espera la la operacion siguiente
    } else {
      _memTotal = _memTotal - _trab;
    }
    setState(() {
      _operador = "-";
      _textPantalla = " ";
      //_textPantalla = "0";
    });
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

            Container(  // Caja donde se muestra el resultado (pantalla de la calculadora)
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  width: 2,
                  color: Colors.black,
                ),
              ),
              height: 80, //60
              width:  224,
              child: Text(
                _operador +" "+ _textPantalla, //"$_trab",
                style: TextStyle(fontSize: 40),
                textAlign: TextAlign.right,
              ),
            ),

            Container(  // Contiene los botones de la calculadora (Teclado)
              height: 280,
              width:  224,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed:(){
                          _multiplicar();
                        },
                        child: const Text(
                          "*",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed:(){
                          _division();
                        },
                        child: const Text(
                          "/",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),

                      FloatingActionButton(
                        onPressed:(){
                          _borrarUno();
                        },
                        child: const Text(
                          "C",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed:(){
                          _borrarTodo();
                        },
                        child: const Text(
                          "CE",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed:(){
                          _presionarNumero(7);
                        },
                        child: const Text(
                          "7",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed:(){
                          _presionarNumero(8);
                        },
                        child: const Text(
                          "8",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed:(){
                          _presionarNumero(9);
                        },
                        child: const Text(
                          "9",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.green,
                        onPressed:(){
                          _sumar();
                        },
                        child: const Text(
                          "+",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed:(){
                          _presionarNumero(4);
                        },
                        child: const Text(
                          "4",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed:(){
                          _presionarNumero(5);
                        },
                        child: const Text(
                          "5",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed:(){
                          _presionarNumero(6);
                        },
                        child: const Text(
                          "6",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.red,
                        onPressed:(){
                          _restar();
                        },
                        child: const Text(
                          "-",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FloatingActionButton(
                        onPressed:(){
                          _presionarNumero(1);
                        },
                        child: const Text(
                          "1",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed:(){
                          _presionarNumero(2);
                        },
                        child: const Text(
                          "2",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed:(){
                          _presionarNumero(3);
                        },
                        child: const Text(
                          "3",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FloatingActionButton(
                        onPressed:(){
                          _presionarPunto();
                        },
                        child: const Text(
                          ".",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed:(){
                          _presionarNumero(0);
                        },
                        child: const Text(
                          "0",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed:(){
                          _resultado();
                        },
                        child: const Text(
                          "=",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
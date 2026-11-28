import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //mostrar lo que pulsamos en los botones
  void borrarTodo() {
    setState(() {
      pantalla = '';
      operacionAnterior = '';
    });
  }
  void borrarEntrada() {
    if (operacionAnterior.isNotEmpty || pantalla == 'Error') {
      borrarTodo();
      return;
    }

    setState(() {
      // Quita el número del final, incluida su parte decimal.
      pantalla = pantalla.replaceFirst(RegExp(r'[0-9.,]+$'), '');

      // Si estábamos escribiendo un único número negativo, quita también el signo.
      if (pantalla == '-') pantalla = '';
    });
  }
  void borrarCaracter() {
    if (pantalla == 'Error') {
      borrarTodo();
      return;
    }

    if (pantalla.isEmpty) return;

    setState(() {
      pantalla = pantalla.substring(0, pantalla.length - 1);
      operacionAnterior = '';
    });
  }
  String pantalla = '';
  String operacionAnterior = '';
  void escribirNumero(String numero) {
    final esOperador = ['+', '-', '*', '/'].contains(numero);

    setState(() {
      if (pantalla == 'Error' || (operacionAnterior.isNotEmpty && !esOperador)) {
        pantalla = '';
      }

      operacionAnterior = '';
      pantalla += numero;
    });
  }

  void calcular() {
    final operacion = pantalla.trim()
        .replaceAll('×', '*')
        .replaceAll('÷', '/')
        .replaceAll(',', '.');

    if (operacion.isEmpty) return;

    String resultado;

    try {
      final expresion = GrammarParser().parse(operacion);
      final valor = RealEvaluator(ContextModel()).evaluate(expresion);

      resultado = valor.isFinite
          ? valor.toString().replaceFirst(RegExp(r'\.0$'), '')
          : 'Error';
    } on FormatException {
      resultado = 'Error';
    } on ArgumentError {
      resultado = 'Error';
  }
  

  setState(() {
    operacionAnterior = '$pantalla =';
    pantalla = resultado;
  });
}

  

  @override
  Widget build(BuildContext context) {
    final partes = pantalla.split(RegExp(r'[+*/-]'));
    final textoSuperior = (operacionAnterior.isNotEmpty
            ? operacionAnterior
            : pantalla)
        .replaceAll('*', ' × ')
        .replaceAll('/', ' ÷ ')
        .replaceAll('+', ' + ')
        .replaceAll('-', ' − ')
        .trim();

    final textoInferior = operacionAnterior.isNotEmpty
        ? pantalla
        : partes.lastWhere((parte) => parte.isNotEmpty, orElse: () => '0');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    textoSuperior,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 18, color: (Colors.grey),
                    )
                  ),
                  const SizedBox(height: 4),
                  Text(
                    textoInferior,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 36),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: 
                  FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: (){
                  pantalla = '($pantalla)/100';
                  calcular();
                },
                child: const Text('%'),
                )              
              ),
              Expanded(
                child: 
                  FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: borrarEntrada,
                child: const Text('CE'),
                )              
              ),
              Expanded(
                child: 
                  FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: borrarTodo,
                child: const Text('C'),
                )              
              ),
              Expanded(
                child: 
                  FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: borrarCaracter,
                child: Icon(Icons.backspace_outlined),
                )              
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: 
                  FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
                child: const Text('²√x'),
                )              
              ),
              Expanded(
                child: 
                  FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
                child: const Text('1/x'),
                )              
              ),
              Expanded(
                child: 
                  FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
                child: Icon(Icons.superscript),
                )              
              ),
              Expanded(
                child: 
                  FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
                child: const Text('÷'),
                )              
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: 
                FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: () => escribirNumero('7'),
                child: const Text('7'),
                )
              ),
              Expanded(
                child: 
                FloatingActionButton(
                  backgroundColor: Colors.black54,
                  foregroundColor: Colors.amber,
                  onPressed: () => escribirNumero('8'),
                  child: const Text('8'),
                ),
              ),
              Expanded(
                child: 
                FloatingActionButton(
                  backgroundColor: Colors.black54,
                  foregroundColor: Colors.amber,
                  onPressed: () => escribirNumero('9'),
                  child: const Text('9'),
                ),
              ),
              Expanded(
                child: 
                FloatingActionButton(
                  backgroundColor: Colors.black54,
                  foregroundColor: Colors.amber,
                  onPressed: () => escribirNumero('*'),
                  child: Icon(Icons.close),
                )
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: 
                FloatingActionButton(
                  backgroundColor: Colors.black54,
                  foregroundColor: Colors.amber,
                  onPressed: () => escribirNumero('4'),
                  child: const Text('4'),
                ),
              ),
              Expanded(
                child: 
                FloatingActionButton(
                  backgroundColor: Colors.black54,
                  foregroundColor: Colors.amber,
                  onPressed: () => escribirNumero('5'),
                  child: const Text('5'),
                ),
              ),
              Expanded(
                child: 
                FloatingActionButton(
                  backgroundColor: Colors.black54,
                  foregroundColor: Colors.amber,
                  onPressed: () => escribirNumero('6'),
                  child: const Text('6'),
                ),
              ),
              Expanded(
                child: 
                FloatingActionButton(
                  backgroundColor: Colors.black54,
                  foregroundColor: Colors.amber,
                  onPressed: () => escribirNumero('-'),
                  child: Icon(Icons.remove),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: 
                FloatingActionButton(
                  backgroundColor: Colors.black54,
                  foregroundColor: Colors.amber,
                  onPressed: () => escribirNumero('1'),
                  child: const Text('1'),
                ),
              ),
              Expanded(
                child: 
                FloatingActionButton(
                  backgroundColor: Colors.black54,
                  foregroundColor: Colors.amber,
                  onPressed: () => escribirNumero('2'),
                  child: const Text('2'),
                ),
              ),
              Expanded(
                child: 
                FloatingActionButton(
                  backgroundColor: Colors.black54,
                  foregroundColor: Colors.amber,
                  onPressed: () => escribirNumero('3'),
                  child: const Text('3'),
                ),
              ),
              Expanded(
                child: 
                FloatingActionButton(
                  backgroundColor: Colors.black54,
                  foregroundColor: Colors.amber,
                  onPressed: () => escribirNumero('+'),
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: 
                FloatingActionButton(
                  backgroundColor: Colors.black54,
                  foregroundColor: Colors.amber,
                  onPressed: () => escribirNumero('0'),
                  child: const Text('0'),
                ),
              ),
              Expanded(
                child: 
                FloatingActionButton(
                  backgroundColor: Colors.black54,
                  foregroundColor: Colors.amber,
                  onPressed: () => escribirNumero(','),
                  child: const Text(','),
                ),
              ),
              Expanded(
                child: 
                FloatingActionButton(
                  backgroundColor: Colors.black54,
                  foregroundColor: Colors.amber,
                  onPressed: calcular,
                  child: Icon(Icons.drag_handle),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

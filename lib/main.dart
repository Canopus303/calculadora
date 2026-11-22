import 'package:flutter/material.dart';

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
  String pantalla = '';
  void escribirNumero(String numero){
    setState(() {
      pantalla = pantalla + numero;
    });
  }

  void sumar(){

  }

  void restar(){

  }

  void multiplicar(){

  }

  void dividir(){

  }

  void raiz(){

  }

  void cuadrado(){

  }

  void fraccion(){

  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              pantalla.isEmpty ? '   ' : pantalla,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 28),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
                child: const Text('√'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
                child: const Text('1/x'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
                child: const Text('x2'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: () => escribirNumero('/'),
                child: const Text('/'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: () => escribirNumero('7'),
                child: const Text('7'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: () => escribirNumero('8'),
                child: const Text('8'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: () => escribirNumero('9'),
                child: const Text('9'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: () => escribirNumero('*'),
                child: const Text('x'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: () => escribirNumero('4'),
                child: const Text('4'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: () => escribirNumero('5'),
                child: const Text('5'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: () => escribirNumero('6'),
                child: const Text('6'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: () => escribirNumero('-'),
                child: const Text('-'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: () => escribirNumero('1'),
                child: const Text('1'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: () => escribirNumero('2'),
                child: const Text('2'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: () => escribirNumero('3'),
                child: const Text('3'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: () => escribirNumero('+'),
                child: const Text('+'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: () => escribirNumero('0'),
                child: const Text('0'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: () => escribirNumero(','),
                child: const Text(','),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
                child: const Text('='),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

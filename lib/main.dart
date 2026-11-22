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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
                child: const Text('1'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
                child: const Text('2'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
                child: const Text('3'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
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
                onPressed: null,
                child: const Text('7'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
                child: const Text('8'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
                child: const Text('9'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
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
                onPressed: null,
                child: const Text('4'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
                child: const Text('5'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
                child: const Text('6'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
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
                onPressed: null,
                child: const Text('1'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
                child: const Text('2'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
                child: const Text('3'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
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
                onPressed: null,
                child: const Text('+/-'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
                child: const Text('0'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.amber,
                onPressed: null,
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

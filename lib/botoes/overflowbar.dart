import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Olá Flutter')),
        body: Center(
          child: Column(
            children: [
              const Text("OverflowBar:"),
              OverflowBar(
                alignment: MainAxisAlignment.start,
                children: [
                  TextButton(onPressed: () {}, child: const Text('Cancelar')),
                  ElevatedButton(onPressed: () {}, child: const Text('Salvar')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

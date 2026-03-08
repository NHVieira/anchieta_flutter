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
  String? _selectedRadio = 'A';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Olá Flutter')),
        body: Center(
          child: Column(
            children: [
              const Text("RadioButton:"),
              Row(
                children: [
                  Radio<String>(
                    value: 'A',
                    groupValue: _selectedRadio,
                    onChanged: (val) => setState(() => _selectedRadio = val),
                  ),
                  const Text("Opção A"),
                  Radio<String>(
                    value: 'B',
                    groupValue: _selectedRadio,
                    onChanged: (val) => setState(() => _selectedRadio = val),
                  ),
                  const Text("Opção B"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

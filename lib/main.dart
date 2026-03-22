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
  final TextEditingController _controller = TextEditingController();
  String _nomeProduto = "";
  double _sliderValue = 20.0;
  String?  _selectedRadio = 'A';
  String? _dropdownValue;
  bool _estaChecado = false;
  final bool _estaChecadoDois = false;
  String _resumo = ""; 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Olá Amigo')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Text Field Start
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Digite o nome do Produto:',
                  border: OutlineInputBorder(),
                ),
                onChanged: (valor) {
                  setState(() {
                    _nomeProduto = valor;
                  });
                },
              ),
              //Slider Start 
              Text("Defina a Quantidade: (Valor: ${_sliderValue.round()}):"),
              Slider(
                value: _sliderValue,
                min: 0,
                max: 100,
                divisions: 100,
                label: _sliderValue.round().toString(),
                onChanged: (double val) => setState(() => _sliderValue = val),
              ),
              //Radio button Start
              Radio<String>(
                value: 'Carreto',
                groupValue: _selectedRadio,
                onChanged: (val) => setState(() => _selectedRadio = val),
                ),
                const Text("Carreto"),
                Radio<String>(
                value: 'Retirada',
                groupValue: _selectedRadio,
                onChanged: (val) => setState(() => _selectedRadio = val),
                ),
                const Text('Retirada'),
                Radio<String>(
                value: 'Correio',
                groupValue: _selectedRadio,
                onChanged: (val) => setState(() => _selectedRadio = val),
                ),
                const Text("Correio"),
                //Radio button Stop
                //Drop Down Start
                DropdownButton<String>(
                  value: _dropdownValue,
                  hint: Text('Regiões'),
                  onChanged: (String? newValue) {
                    setState(() => _dropdownValue = newValue!);
                  },
                  items: <String>['Acre','Alagoas','Amapá','Amazonas','Bahia','Ceará','Espírito Santo','Goiás','Maranhão','Mato Grosso','Mato Grosso do Sul',
                      'Minas Gerais','Pará','Paraíba','Paraná','Pernambuco','Piauí','Rio de Janeiro','Rio Grande do Norte','Rio Grande do Sul','Rondônia',
                      'Roraima','Santa Catarina','São Paulo','Sergipe','Tocantins','Distrito Federal']
                      .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                      .toList(),
                ),
                //CheckBox Start                
                Checkbox(
                  value: _estaChecado,
                  onChanged: (bool? value){
                    setState(() => _estaChecado = value!);
                  },                
                ),
                const Text("Aceite termos e condições e promoçoes por E-mail?"),
                //CheckBox End
                //Botao Cadastrar

                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      _resumo = "Nome do Produto: $_nomeProduto Quantidade: $_sliderValue Transporte: $_selectedRadio Região: $_dropdownValue Aceite: $_estaChecado ";
                      _controller.clear();
                      });
                  },
                  child: Text("Cadastrar"),
                ),
                Text(_resumo,
                key: const Key('resumo'),),                
            ],
          ),
        ),
      ),
    );
  }
}

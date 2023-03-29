import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  double _imc = 0.0;
  String? _status;

  void _calcImc() {
    final peso = double.parse(pesoController.text);
    final altura = double.parse(alturaController.text);
    final imc = peso / (altura * altura);
    setState(() => _imc = imc);
  }

//TODO adicionar a classificação
  void _classificacao() {
    String faixa;
    if (_imc < 18.5) {
      faixa = "baixo peso";
    } else if (_imc <= 24.99) {
      faixa = "normal";
    } else if (_imc <= 29.99) {
      faixa = "sobrepeso";
    } else {
      faixa = "obesidade";
    }
    setState(() => _status = faixa);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 131, 136),
        leading: Container(),
        title: const Text("testando conhecimento"),
      ),
      body: Center(
        child: Container(
          color: const Color.fromARGB(255, 44, 51, 51),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: pesoController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: "Peso (kg)",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 14, 131, 136),
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: alturaController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: "Altura (m)",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 14, 131, 136),
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                color: const Color.fromARGB(255, 14, 131, 136),
                width: 300,
                height: 60,
                child: Text(
                  _imc.toStringAsFixed(2),
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.w400),
                ),
              ),
              ElevatedButton(
                  onPressed: _calcImc, child: const Text("calcular")),
            ],
          ),
        ),
      ),
    );
  }
}

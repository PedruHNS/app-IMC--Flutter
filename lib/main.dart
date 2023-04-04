import 'package:aplicando_conhecimento/widget/box_calc.dart';
import 'package:aplicando_conhecimento/widget/input_text.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  double _imc = 0.0;
  String _status = "";

  @override
  void dispose() {
    _pesoController.dispose();
    _alturaController.dispose();
    super.dispose();
  }

  void _calcImc() {
    final peso = double.parse(_pesoController.text);
    final altura = double.parse(_alturaController.text);
    _imc = peso / (altura * altura);

    if (_imc < 18.5) {
      _status = "baixo peso";
    } else if (_imc <= 24.99) {
      _status = "normal";
    } else if (_imc <= 29.99) {
      _status = "sobrepeso";
    } else {
      _status = "obesidade";
    }
    setState(() {
      _imc;
      _status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 131, 136),
        leading: Container(),
        title: const Text("testando conhecimento"),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Center(
          child: Container(
            color: const Color.fromARGB(255, 203, 207, 207),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputText(
                  icone: MdiIcons.humanMaleHeightVariant,
                  controller: _alturaController,
                  hintText: "altura (m)",
                ),
                InputText(
                  icone: MdiIcons.weightKilogram,
                  controller: _pesoController,
                  hintText: "Peso (Kg)",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BoxCalc(
                      icone: MdiIcons.armFlex,
                      display: _status,
                    ),
                    BoxCalc(
                      icone: MdiIcons.abjadHebrew,
                      display: _imc.toStringAsFixed(2),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      _calcImc();
                    },
                    child: const Text("calcular")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

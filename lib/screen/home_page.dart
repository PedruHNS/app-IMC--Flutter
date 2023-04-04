import 'package:aplicando_conhecimento/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widget/box_calc.dart';
import '../widget/input_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _form = GlobalKey<FormState>();
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

  void _clear() {
    _pesoController.clear();
    _alturaController.clear();
    setState(() {
      _imc = 0.00;
      _status = "";
    });
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

  void _validationForm() {
    if (_form.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 131, 136),
        leading: Container(),
        title: const Text("IMC"),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Center(
          child: Container(
            color: const Color.fromARGB(255, 203, 207, 207),
            child: Form(
              key: _form,
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
                        icone: MdiIcons.human,
                        display: _imc > 0.00 ? _imc.toStringAsFixed(2) : "",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomButton(
                        nome: "calcular",
                        onPressed1: _calcImc,
                        onPressed2: _validationForm, //!função não funciona
                      ),
                      CustomButton(
                        nome: "Limpar",
                        onPressed1: _clear,
                        onPressed2: null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

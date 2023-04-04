import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String nome;
  final Function onPressed1;
  final Function? onPressed2; //!passei por parametro mas n funciona.

  const CustomButton({
    super.key,
    required this.onPressed1,
    required this.onPressed2,
    required this.nome,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color.fromARGB(255, 14, 131, 136),
        ),
      ),
      onPressed: () {
        onPressed1();
        //!verificar por que não roda a segunda função
        onPressed2;
      },
      child: Text(
        nome,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String nome;
  final Function onPressed;

  const CustomButton({
    super.key,
    required this.onPressed,
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
        onPressed();
      
       
      },
      child: Text(
        nome,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}

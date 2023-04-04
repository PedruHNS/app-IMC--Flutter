import 'package:flutter/material.dart';

class BoxCalc extends StatelessWidget {
  final IconData icone;
  final String display;
  const BoxCalc({
    super.key,
    required this.icone,
    required this.display,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 14, 131, 136),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(137, 0, 0, 0),
                spreadRadius: 1.1,
                offset: Offset(1, 1),
                blurRadius: 1)
          ],
        ),
        width: 150,
        height: 60,
        child: Row(
          children: [
            Icon(
              icone,
              size: 30,
              color: Colors.black,
            ),
            if (display.isEmpty)
              Text(
                display,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class botao_navegacao extends StatelessWidget {
  const botao_navegacao({super.key, required this.texto, required this.onPressed});

  final String texto;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 20),
        ),
        child: Text(texto),
      ),
    );
  }
}

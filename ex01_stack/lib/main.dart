import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      title: 'Exercício 01 - Usando o Stack',
      debugShowCheckedModeBanner: false,
      home: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.amber,
          ),
          Container(
            height: 50,
            width: 50,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
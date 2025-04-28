import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 190, 207, 112)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  String display = ""; // o que aparece para o usuário
  String operador = ""; // guarda o operador atual (+, -, *, /)
  double? primeiroNumero; // guarda o primeiro número
  double? segundoNumero; // guarda o segundo número
  bool esperandoSegundoNumero = false; // para saber se está esperando o segundo número

  void trataClique(String valor) {
    setState(() { // <-- Agora com setState para atualizar a tela!
      if (valor == 'C') {
        // Limpar tudo
        display = "";
        primeiroNumero = null;
        segundoNumero = null;
        operador = "";
        esperandoSegundoNumero = false;
      } 
      else if (valor == '+' || valor == '-' || valor == '*' || valor == '/') {
        // Quando clicar em operador
        if (display.isNotEmpty) {
          primeiroNumero = double.parse(display);
          operador = valor;
          esperandoSegundoNumero = true;
          display = "";
        }
      } 
      else if (valor == '=') {
        // Quando clicar em igual
        if (operador.isNotEmpty && display.isNotEmpty) {
          segundoNumero = double.parse(display);
          double resultado = calcular(primeiroNumero!, segundoNumero!, operador);
          display = resultado.toString();
          // Agora o resultado vira o primeiro número para continuar operando
          primeiroNumero = resultado;
          segundoNumero = null;
          operador = "";
          esperandoSegundoNumero = false;
        }
      } 
      else {
        // Clicou em número
        display += valor;
      }
    });
  }

  double calcular(double num1, double num2, String op) {
    switch (op) {
      case '+':
        return num1 + num2;
      case '-':
        return num1 - num2;
      case '*':
        return num1 * num2;
      case '/':
        if (num2 == 0) {
          return 0; // evitar divisão por zero
        }
        return num1 / num2;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Display
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 223, 223, 223),
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                display,
                style: const TextStyle(
                  color: Colors.black, // <- Corrigido: cor preta no texto
                  fontSize: 50,
                ),
              ),
            ),
          ),
          // Botões
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.white,
              child: GridView.count(
                crossAxisCount: 4, // 4 colunas
                children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('/'),
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('*'),
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('-'),
                  buildButton('0'),
                  buildButton('C'),
                  buildButton('='),
                  buildButton('+'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // Função para criar botões
  Widget buildButton(String texto) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[100],
          foregroundColor: Colors.black,
          textStyle: const TextStyle(fontSize: 25),
        ),
        onPressed: () {
          trataClique(texto);
        },
        child: Text(texto),
      ),
    );
  }
}

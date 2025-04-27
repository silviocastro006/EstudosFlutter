import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const List<String> operadores = <String>["+", "-", "/", "x"];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 183, 183)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora Simples'),
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
  
  String valorDrop = operadores.first;

  double resultado = 0;

  final TextEditingController control01 = TextEditingController();
  final TextEditingController control02 = TextEditingController();

  void Calculo()
  {
    setState(() {
      var num01 = double.parse(control01.text);
      var num02 = double.parse(control02.text);

      if(valorDrop == "+"){
        resultado = (num01+num02);
      } else if(valorDrop == "-"){
        resultado = (num01-num02);
      } else if(valorDrop == "/"){
        resultado = (num01/num02);
      } else if(valorDrop == "x"){
        resultado = (num01*num02);
      }

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(40, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 300,
              child: Text("Número 01"),
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: control01,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 300,
              child: Text("Operação"),
            ),
            SizedBox(
                width: 300,
                child: Container(
                  alignment: Alignment.center,
                  child: DropdownButton<String>(
                      elevation: 12,
                      isExpanded: true,
                      items: operadores
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      value: valorDrop,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          valorDrop = value!;
                        });
                      }),
                )),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 300,
              child: Text("Número 02"),
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: control02,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {Calculo();}, child: Text("Calcular")),
            SizedBox(
              height: 20,
            ),
            Text(
              resultado.toString(),
            )
          ],
        ),
      ),
    );
  }
}

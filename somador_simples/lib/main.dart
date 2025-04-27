import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const App(title: 'Somador Simples'),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key, required String title});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  
  int resultado = 0;

  final TextEditingController controlV1 = TextEditingController();

  final TextEditingController controlV2 = TextEditingController();

  void Atualizar_valor()
  {
    setState(() {
      var num01 = int.parse(controlV1.text);
      var num02 = int.parse(controlV2.text);
      var soma = (num01+num02);
      resultado = soma;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 211, 211, 211),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 45, 132, 202),
        title: Text(
          "Somador Simples",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              "SOMA",
              style: TextStyle(
                fontSize: 40
              ),
            ),
            SizedBox(
              height: 20
            ),
            SizedBox(
              width: 300,
              child: Text(
                "Número 01",
                 textAlign: TextAlign.start,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.5,)
              ),
              width: 300,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: controlV1, 
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  filled: true
                ),               
                ),
              ),
            SizedBox(
              height: 20
            ),
            SizedBox(
              width: 300,
              child: Text(
                "Número 02",
                 textAlign: TextAlign.start,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.5,)
              ),
              width: 300,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: controlV2, 
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  filled: true
                ),               
                ),
              ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){Atualizar_valor();}, child: Text("Calcular")),
            SizedBox(
            height: 25,
          ),
          Text(resultado.toString(),
            style: TextStyle(
              fontSize: 40
            ),),
          ],
        ),
      ) 
    );
  }
}

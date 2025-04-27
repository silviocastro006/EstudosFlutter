import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// método obrigatório para rodar o código
void main() {
  runApp(const Filtro());
}

// interface externa principal
class Filtro extends StatelessWidget {
  const Filtro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filtro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 137, 183)),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Filtro'),
    );
  }
}

// classe da tela
class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// classe do estado
class _MyHomePageState extends State<MyHomePage> {
  final List<int> numeros = [];
  List<int> listaExibida = [];
  final TextEditingController controlnum = TextEditingController();
  final TextEditingController controlfil = TextEditingController();

  void adicionaNumero(valor) {
    setState(() {
      if (valor == null || valor.toString().isEmpty) {
        mostrarAlerta("Erro", "Digite um número válido");
        return;
      }

      if (valor != null && valor.isNotEmpty) {
        numeros.add(int.parse(valor));
        listaExibida = List.from(numeros);
        controlnum.clear();
        mostrarAlerta("Sucesso", "Número adicionado com sucesso!");
      }
    });
  }

  void filtrarLista(valor) {
    setState(() {
        if (valor == null || valor.isEmpty) {
              // Se o campo está vazio, mostra a lista inteira
              listaExibida = List.from(numeros);
              mostrarAlerta("Info", "Filtro limpo. Mostrando todos os números.");
            } else {
              List<int> filtrada = [];

              for (int i = 0; i < numeros.length; i++) {
                if (numeros[i] == int.parse(valor)) {
                  filtrada.add(numeros[i]);
                }
              }

              if (filtrada.isEmpty) {
                mostrarAlerta("Aviso", "Nenhum número encontrado para o filtro.");
              }

              listaExibida = filtrada;
            }

            controlfil.clear(); // Limpa o campo de filtro
          });
  }

  void mostrarAlerta(String titulo, String mensagem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(mensagem),
          actions: [
            TextButton(onPressed: (){Navigator.of(context).pop();}, child: const Text("OK"),)
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(188, 165, 165, 165),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 400,
              width: 500,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255)),
              child: Flexible(
                child: ListView.builder(
                  itemCount: listaExibida.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      listaExibida[index].toString(),
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: controlfil,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Valor do Filtro",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            width: 10))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: controlnum,
                decoration: InputDecoration(
                    hintText: "Número",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            width: 10))),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                adicionaNumero(controlnum.text);
              },
              child: Text(
                "Inserir",
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                filtrarLista(controlfil.text);
              },
              child: Text(
                "Filtrar",
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}

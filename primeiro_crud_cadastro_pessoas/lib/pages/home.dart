import 'package:flutter/material.dart';
import 'package:primeiro_crud_cadastro_pessoas/controller/pessoacontroller.dart';
import 'package:primeiro_crud_cadastro_pessoas/pages/inserirPessoa.dart';
import 'package:primeiro_crud_cadastro_pessoas/pages/listarPessoa.dart';
import 'package:primeiro_crud_cadastro_pessoas/widgets/botao_navegacao.dart';
import 'package:provider/provider.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 182, 179, 171),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Cadastro de Pessoas"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            botao_navegacao(texto: 'Inserir', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => inserirPessoa()));}),
            botao_navegacao(texto: 'Listar', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ListarPessoas()));}),
            botao_navegacao(texto: 'Editar', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ListarPessoas()));}),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){confirmarExclusaoTotal(context);},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: Text('Excluir'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void confirmarExclusaoTotal(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Confirmar Exclusão'),
        content: const Text('Tem certeza que deseja apagar todos os registros? Esta ação não pode ser desfeita.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fecha o AlertDialog sem fazer nada
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              context.read<Pessoacontroller>().ExcluirTodasPessoas();
              Navigator.of(context).pop(); // Fecha o AlertDialog após excluir
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Todos os registros foram apagados!'))
              );
            },
            child: const Text('Confirmar', style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    }
  );
}

}
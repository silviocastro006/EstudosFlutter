import 'package:flutter/material.dart';
import 'package:primeiro_crud_cadastro_pessoas/controller/pessoacontroller.dart';
import 'package:primeiro_crud_cadastro_pessoas/model/pessoa.dart';
import 'package:primeiro_crud_cadastro_pessoas/pages/editarPessoa.dart';
import 'package:provider/provider.dart';

class ListarPessoas extends StatefulWidget {
  const ListarPessoas({super.key});

  @override
  State<ListarPessoas> createState() => _ListarPessoasState();
}

class _ListarPessoasState extends State<ListarPessoas> {
  Pessoa? pessoaSelecionada;

  @override
  Widget build(BuildContext context) {
    // Usando watch para ouvir mudanças no Pessoacontroller
    List<Pessoa> pessoas = context.watch<Pessoacontroller>().listarPessoas();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pessoas Cadastradas'),
        backgroundColor: const Color.fromARGB(255, 151, 108, 43),
      ),
      body: Column(
        children: [
          Expanded(
            child: pessoas.isEmpty
                ? const Center(child: Text('Nenhuma pessoa cadastrada.'))
                : ListView.builder(
                    itemCount: pessoas.length,
                    itemBuilder: (context, index) {
                      final pessoa = pessoas[index];
                      final bool selecionado = pessoaSelecionada == pessoa;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            pessoaSelecionada = pessoa;
                          });
                        },
                        child: Card(
                          color: selecionado ? Colors.grey.shade300 : Colors.white,
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: selecionado ? Colors.blueAccent : Colors.grey.shade400,
                              width: selecionado ? 2 : 1,
                            ),
                          ),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  pessoa.nome,
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  pessoa.cpf,
                                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                                ),
                                Text(
                                  pessoa.telefone,
                                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: pessoaSelecionada != null ? () {
                  final index = pessoas.indexOf(pessoaSelecionada!);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => editarPessoa(pessoaAeditar: pessoaSelecionada!, indexPessoa: index)));
                } : null,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('EDITAR'),
              ),
              ElevatedButton(
                onPressed: pessoaSelecionada != null ? () {
                  setState(() {
                    final index = pessoas.indexOf(pessoaSelecionada!);
                    context.read<Pessoacontroller>().excluirPessoa(index);  // Aqui
                    pessoaSelecionada = null;
                  });
                } : null,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('EXCLUIR'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text('VOLTAR'),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:primeiro_crud_cadastro_pessoas/controller/pessoacontroller.dart';
import 'package:primeiro_crud_cadastro_pessoas/model/pessoa.dart';
import 'package:primeiro_crud_cadastro_pessoas/widgets/botao_navegacao.dart';
import 'package:primeiro_crud_cadastro_pessoas/widgets/campo_cadastro.dart';
import 'package:provider/provider.dart';

class editarPessoa extends StatefulWidget {
  editarPessoa({super.key, required this.pessoaAeditar, required this.indexPessoa});

  final Pessoa pessoaAeditar;
  final int indexPessoa;

  @override
  State<editarPessoa> createState() => _editarPessoaState();
}

class _editarPessoaState extends State<editarPessoa> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController controladorNome = TextEditingController();

  final TextEditingController controladorCPF = TextEditingController();

  final TextEditingController controladorEmail = TextEditingController();

  final TextEditingController controladorNomeMae = TextEditingController();

  final TextEditingController controladorEndereco = TextEditingController();

  final TextEditingController controladorTelefone = TextEditingController();

  @override
  void initState() {
    super.initState();
    controladorNome.text = widget.pessoaAeditar.nome;
    controladorCPF.text = widget.pessoaAeditar.cpf;
    controladorEmail.text = widget.pessoaAeditar.email;
    controladorNomeMae.text = widget.pessoaAeditar.nomeDaMae;
    controladorEndereco.text = widget.pessoaAeditar.endereco;
    controladorTelefone.text = widget.pessoaAeditar.telefone;
  }

  void editar()
  {
    if (_formKey.currentState!.validate()) {
      Pessoa pessoaEditada = Pessoa(
      nome: controladorNome.text,
      cpf: controladorCPF.text,
      email: controladorEmail.text,
      nomeDaMae: controladorNomeMae.text,
      endereco: controladorEndereco.text,
      telefone: controladorTelefone.text,
      );

      context.read<Pessoacontroller>().editarPessoa(widget.indexPessoa, pessoaEditada);


      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pessoa editada com sucesso!'))
      );

      Navigator.of(context).pop();

    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao editar!'))
      );
    }

    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 182, 179, 171),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Inserir Pessoa"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              campoCadastro(controlador: controladorNome, label: 'Nome'),
              const SizedBox(height: 20),
              campoCadastro(controlador: controladorCPF, label: 'CPF'),
              const SizedBox(height: 20),
              campoCadastro(controlador: controladorEmail, label: 'E-mail'),
              const SizedBox(height: 20),
              campoCadastro(controlador: controladorNomeMae, label: 'Nome da Mãe'),
              const SizedBox(height: 20),
              campoCadastro(controlador: controladorEndereco, label: 'Endereço'),
              const SizedBox(height: 20),
              campoCadastro(controlador: controladorTelefone, label: 'Telefone'),
              const SizedBox(height: 20),
              Center(
                child:
                    botao_navegacao(texto: 'Salvar', onPressed: (){editar();}),
              )
            ],
          ),
        ),
      ),
    );
  }
}

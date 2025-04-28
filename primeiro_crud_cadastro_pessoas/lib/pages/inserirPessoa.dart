import 'package:flutter/material.dart';
import 'package:primeiro_crud_cadastro_pessoas/controller/pessoacontroller.dart';
import 'package:primeiro_crud_cadastro_pessoas/model/pessoa.dart';
import 'package:primeiro_crud_cadastro_pessoas/widgets/botao_navegacao.dart';
import 'package:primeiro_crud_cadastro_pessoas/widgets/campo_cadastro.dart';
import 'package:provider/provider.dart';

class inserirPessoa extends StatefulWidget {
  inserirPessoa({super.key});

  @override
  State<inserirPessoa> createState() => _inserirPessoaState();
}

class _inserirPessoaState extends State<inserirPessoa> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController controladorNome = TextEditingController();

  final TextEditingController controladorCPF = TextEditingController();

  final TextEditingController controladorEmail = TextEditingController();

  final TextEditingController controladorNomeMae = TextEditingController();

  final TextEditingController controladorEndereco = TextEditingController();

  final TextEditingController controladorTelefone = TextEditingController();

  void cadastrar()
  {
    if (_formKey.currentState!.validate()) {
      var pNome = controladorNome.text;
      var pCPF = controladorCPF.text;
      var pEmail = controladorEmail.text;
      var pNomeMae = controladorNomeMae.text;
      var pEndereco = controladorEndereco.text;
      var pTelefone = controladorTelefone.text;
      
      Pessoa pessoaNova = Pessoa(
        nome: pNome,
        cpf: pCPF,
        email: pEmail,
        nomeDaMae: pNomeMae,
        endereco: pEndereco,
        telefone: pTelefone
      );

       context.read<Pessoacontroller>().adicionarPessoa(pessoaNova);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pessoa cadastrada com sucesso!'))
      );

      _formKey.currentState!.reset();

    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao cadastrar!'))
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
                    botao_navegacao(texto: 'Cadastrar', onPressed: (){cadastrar();}),
              )
            ],
          ),
        ),
      ),
    );
  }
}

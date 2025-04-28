import 'package:flutter/material.dart';
import 'package:primeiro_crud_cadastro_pessoas/controller/pessoacontroller.dart';
import 'package:primeiro_crud_cadastro_pessoas/model/pessoa.dart';
import 'package:primeiro_crud_cadastro_pessoas/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:primeiro_crud_cadastro_pessoas/pages/inserirPessoa.dart'; // Seu arquivo de cadastro
import 'package:primeiro_crud_cadastro_pessoas/pages/listarPessoa.dart'; // Seu arquivo de listagem

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        Pessoacontroller controller = Pessoacontroller();
        controller.adicionarPessoa(Pessoa(nome: 'João', cpf: '12345678900', telefone: '987654321', email: 'sadfasdfasd', nomeDaMae: 'asdfasdfadfa', endereco: 'adsfasdfasd'));
        return controller;
      },
      child:  App(),
    ),
  );
}

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Pessoas',
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      debugShowCheckedModeBanner: false,
      home: home(),
    );
  }
}
import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {

    String nome = 'Silvio';

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'exemplo@exemplo.com',
              errorText: 'Campo obrigatório',
              prefixText: 'R\$ ',
            ),
            obscureText: true,
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 25, 153, 170))),
                        floatingLabelStyle:
                            TextStyle(color: Color.fromARGB(255, 25, 153, 170)),
                        labelText: 'Adicione uma tarefa',
                        hintText: 'Ex. Estudar Flutter',
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 4, 188, 212),
                        padding: const EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      )),
                ],
              ),
              SizedBox(height: 16),
              ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    color: Colors.red,
                    height: 40,
                  ),
                  Container(
                    color: const Color.fromARGB(255, 216, 174, 171),
                    height: 40,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text('Você possui 0 tarefas pendentes'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 199, 199, 199),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Text('Limpar tudo'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lista_tarefas/Screens/form_screen.dart';
import 'package:lista_tarefas/data/task_inherited.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});
  

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(
          "Tarefas",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 4.0,
        shadowColor: Colors.black,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: TaskInherited.of(context).taskList,
        padding: EdgeInsets.only(top: 8,bottom: 70),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContext: context,),
            ),
          );

          
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

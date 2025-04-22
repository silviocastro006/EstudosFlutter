import 'package:flutter/material.dart';
import 'package:lista_tarefas/Components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required super.child,
  });

  final List<Task> taskList = [
    Task('Aprender Flutter', "assets/images/estudar.jpg", 3),
    Task('Andar de Bike', 'assets/images/bike.jpg', 2),
    Task('Cozinhar', 'assets/images/cozinhar.jpg', 5),
    Task('Vader ui', 'assets/images/flutterVader.jpg', 1),
  ];

  void newTask(String name, String photo,int difficulty){
      taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}

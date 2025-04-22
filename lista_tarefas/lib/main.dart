import 'package:flutter/material.dart';
import 'package:lista_tarefas/Screens/form_screen.dart';
import 'package:lista_tarefas/Screens/initial.screen.dart';
import 'package:lista_tarefas/data/task_inherited.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 7, 59, 102)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            iconColor: WidgetStateProperty.all<Color>(Colors.white),
            backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    5.0),
              ),
            ),
            foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          ))),
      home: TaskInherited(child: const InitialScreen()),
    );
  }
}





import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int count = 0;

  void decrement() {
    setState(() {
      if(count < 0)
    {
      count==0;
    }
      count--;
    });
    print(count);
  }

  void increment() {
    setState(() {
      if(count > 20)
    {
      count==20;
    }

      count++;
    });
    print(count);
  }

  bool get isEmpty => count <= 0;
  bool get isFull => count >= 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 73, 73, 73),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imagens/fundo_contador.jpg'),
            fit: BoxFit.cover,
            ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull? "Lotado" : "Pode entrar!",
              style: TextStyle(
                fontSize: 60,
                color: isFull? Colors.red : Colors.white,
                fontWeight: FontWeight.w700,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(5,5),
                    blurRadius: 4,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(32),
              child: Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 120,
                  color: Colors.white,
                  shadows: <Shadow>[
                  Shadow(
                    offset: Offset(5,5),
                    blurRadius: 4,
                    color: Colors.black,
                  )
                ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor: isEmpty? Colors.white.withOpacity(0.2) : Colors.white,
                    foregroundColor: Colors.red,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(
                    "Saiu",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 50),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor: isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                    foregroundColor: Colors.green,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(
                    "Entrou",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class campoCadastro extends StatefulWidget {
  campoCadastro({super.key, required this.controlador, required this.label});

  final TextEditingController controlador;
  final String label;

  @override
  State<campoCadastro> createState() => _campoCadastroState();
}

class _campoCadastroState extends State<campoCadastro> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.black
      ),
      cursorColor: Colors.black,
      controller: widget.controlador,
      decoration: InputDecoration(
        labelText: widget.label,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        filled: true,
        fillColor: Colors.white,
        labelStyle: TextStyle(
          color: Color.fromARGB(255, 88, 87, 87),
        ),
        focusColor: Colors.black,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(110, 0, 0, 0)),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        errorBorder: const OutlineInputBorder( // <- Nova borda de erro
          borderSide: BorderSide(color: Color.fromARGB(255, 179, 40, 40), width: 2), // <- cor laranja no erro
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedErrorBorder: const OutlineInputBorder( // <- Nova borda de erro quando focado
          borderSide: BorderSide(color: Color.fromARGB(255, 155, 7, 7), width: 2), // <- cor diferente no foco do erro
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        errorStyle: TextStyle(
          color: Color.fromARGB(255, 155, 7, 7), // Aqui define a cor da mensagem de erro
          fontSize: 14, // Opcional
        ),
      ),
      validator: (value){
        if (value == null || value.isEmpty){
          return 'Por favor, preencha o ${widget.label}!';
        }
        return null;
      },
    );
  }
}

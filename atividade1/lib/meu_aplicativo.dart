import 'package:atividade1/pages/moedas_pages.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoedasBase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green, // Definindo a cor principal
        appBarTheme: AppBarTheme(
          color: Colors.teal, // Força a cor do AppBar
        ),
      ),
      home: const MoedasPage(),
    );
  }
}

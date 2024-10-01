import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key}); // Construtor com 'const' e chave de superclasse

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove o banner "debug"
      title: 'Aplicativo Bancário',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define o tema com cor azul
      ),
      home: const PaginaInicial(), // Chama a página inicial
    );
  }
}

class PaginaInicial extends StatelessWidget {
  const PaginaInicial(
      {super.key}); // Construtor com 'const' e chave de superclasse

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Contas Bancárias'), // Título do AppBar
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0), // Espaçamento ao redor dos itens
        children: const [
          Card(
            // Primeiro cartão
            child: ListTile(
              leading: Icon(Icons.account_balance), // Ícone à esquerda
              title: Text('Conta Corrente'),
              subtitle: Text('Saldo disponível: R\$ 2.000,00'),
            ),
          ),
          Card(
            // Segundo cartão
            child: ListTile(
              leading: Icon(Icons.money), // Ícone à esquerda
              title: Text('Transferência'), //"h1"
              subtitle: Text('Você enviou R\$ 500,00'), //'h3'
            ),
          ),
          Card(
            // Terceiro cartão
            child: ListTile(
              leading: Icon(Icons.history), // Ícone à esquerda
              title: Text('Histórico de Transações'),
              subtitle: Text('Última transação: R\$ 150,00'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.history), // Ícone à esquerda
              title: Text('joaojoao'),
              subtitle: Text('joaojoajoa'),
            ),
          )
        ],
      ),
    );
  }
}

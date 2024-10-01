import 'package:flutter/material.dart';
import '../models/cliente.dart';

class ListaClientesScreen extends StatelessWidget {
  final List<Cliente> clientes;

  ListaClientesScreen({required this.clientes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Clientes'),
      ),
      body: ListView.builder(
        itemCount: clientes.length,
        itemBuilder: (context, index) {
          final cliente = clientes[index];
          return ListTile(
            title: Text('${cliente.nome}'),
            subtitle: Text('Saldo: R\$${cliente.saldo.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _editarCliente(context, cliente, index);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _removerCliente(context, index);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Função para editar um cliente
  void _editarCliente(BuildContext context, Cliente cliente, int index) {
    final TextEditingController _nomeController =
        TextEditingController(text: cliente.nome);
    final TextEditingController _saldoController =
        TextEditingController(text: cliente.saldo.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar Cliente'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: _saldoController,
                decoration: InputDecoration(labelText: 'Saldo'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                cliente.nome = _nomeController.text;
                cliente.saldo = double.parse(_saldoController.text);
                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  // Função para remover cliente
  void _removerCliente(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Remover Cliente'),
          content: Text('Tem certeza que deseja remover este cliente?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                clientes.removeAt(index);
                Navigator.of(context).pop();
              },
              child: Text('Sim'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Não'),
            ),
          ],
        );
      },
    );
  }
}

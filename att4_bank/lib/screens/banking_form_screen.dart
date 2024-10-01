import 'package:flutter/material.dart';
import '../models/cliente.dart';
import 'lista_clientes_screen.dart';

class BankingFormScreen extends StatefulWidget {
  @override
  _BankingFormScreenState createState() => _BankingFormScreenState();
}

class _BankingFormScreenState extends State<BankingFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _saldoController = TextEditingController();
  final List<Cliente> _clientes = [];

  // Função para adicionar cliente à lista
  void _adicionarCliente() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _clientes.add(
          Cliente(
            nome: _nomeController.text,
            saldo: double.parse(_saldoController.text),
          ),
        );
        _nomeController.clear();
        _saldoController.clear();
      });
    }
  }

  // Navegação para a tela da lista
  void _navegarParaLista(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListaClientesScreen(clientes: _clientes),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome do Cliente'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _saldoController,
                decoration: InputDecoration(labelText: 'Saldo Inicial'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o saldo';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _adicionarCliente,
                child: Text('Adicionar Cliente'),
              ),
              ElevatedButton(
                onPressed: () => _navegarParaLista(context),
                child: Text('Ver Lista de Clientes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// TODO Implement this library.
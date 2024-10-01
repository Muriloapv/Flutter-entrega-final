import 'package:flutter/material.dart';
import '../widgets/item_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _items = []; // Lista dinâmica para armazenar os itens
  final TextEditingController _controller = TextEditingController();

  void _addItem() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _items.add(_controller.text); // Adiciona o item à lista
        _controller.clear(); // Limpa o campo após a submissão
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Form with ListView'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Digite um item'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addItem,
              child: Text('Adicionar Item'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ItemList(items: _items), // Usando o widget ItemList
            ),
          ],
        ),
      ),
    );
  }
}

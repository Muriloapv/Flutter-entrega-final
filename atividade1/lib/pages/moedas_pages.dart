import 'package:atividade1/repositories/moeda_repository.dart';
import 'package:flutter/material.dart';

class MoedasPage extends StatelessWidget {
  const MoedasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabela = MoedaRepository.tabela;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Cripto Moedas'),
        ),
        body: ListView.separated(
            itemBuilder:( BuildContext, int moeda){
              return ListTile(
                leading: image.asset(Table[moeda].sigla),
                title: text(tablea[moeda].preco),
              )
            },
            padding: EdgeInsets.all(16),
            separatorBuilder: (_,_) => Divider(),
            itemCount: tabela.length, ));
  }
}

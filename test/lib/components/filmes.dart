import 'package:flutter/material.dart';
import 'package:test/components/card.dart';
import 'package:test/models/model.dart';



class ListaFilmes extends StatelessWidget {
  const ListaFilmes({
    super.key,
    required this.filmes,
  });

  final List<Filme> filmes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 4,
      ),
      itemCount: filmes.length,
      itemBuilder: ((context, index) {
        final filme = filmes[index];
        return CardFilme(
          nome: filme.nome,
          imagem: filme.imagem,
        );
      }),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:test/components/filmes.dart';
import 'package:test/models/model.dart';
import 'package:test/service/service.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Filme>>? futureFilmes;

  @override
  void initState() {
    futureFilmes = getFilmes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filmes Studio Ghibli"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: futureFilmes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final filmes = snapshot.data as List<Filme>;
            return ListaFilmes(filmes: filmes);
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
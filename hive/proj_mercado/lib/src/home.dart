import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:proj_mercado/model/produtos.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:hive_generator/hive_generator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future testingHive() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final collection = await BoxCollection.open('Collection', {'listShop'}, path: directory.path);
   // Hive.registerAdapter(Produto());
    var box = await collection.openBox<Produto>('listShop');
    var produto = Produto('Cereais', 'Arroz', 5, false);
 
    await box.put(produto.depto, Produto('Cereais', 'arroz', 5, false));
    print(box.get(produto.depto));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              testingHive();
            },
            child: Text('adicionar')),
      ),
    );
  }
}

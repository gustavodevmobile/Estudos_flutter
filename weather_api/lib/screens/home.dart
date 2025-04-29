import 'package:flutter/material.dart';
import 'package:wheater_api/main.dart';
import 'package:wheater_api/screens/wheather.dart';

class Home extends StatefulWidget {
 
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int count = 210;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Learning APIs'),
        ),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      count++;
                      print(count);
                      Navigator.pushNamed(context, 'weather',
                          arguments: Arguments(count));
                    },
                    child: Text('Previsão do Tempo')),
              ),
            ],
          ),
        ));
  }
}

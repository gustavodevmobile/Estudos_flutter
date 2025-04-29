import 'package:flutter/material.dart';
import 'package:tela_uber_conta/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Copy accont uber balance',
      theme: ThemeData(brightness: Brightness.light),
      home: Home(),
    );
  }
}


import 'package:button_circle/button_circle.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Transition',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ButtonCircle(),
    );
  }
}
import 'package:crud/data/prod_register.dart';
// import 'package:crud/screens/form.dart';
import 'package:crud/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PersonRegInherited(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.blue),
        ),
        home: const Home(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:web/screen.dart/home.dart';
import 'package:web/screen.dart/screen1.dart';

import 'package:web/models/model1.dart';
import 'package:web/screen.dart/screen2.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Model1('no value'))
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        'screen1': (context) => const Screen1(),
        'screen2': (context) => const Screen2()
      },
    );
  }
}

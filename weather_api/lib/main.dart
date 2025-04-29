import 'package:flutter/material.dart';

import 'package:wheater_api/screens/home.dart';
import 'package:wheater_api/screens/wheather.dart';

void main() {
  runApp(const MyApp());
}

class Arguments {
  final int countRequest;
  Arguments(this.countRequest);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.blue)),
      initialRoute: 'home',
      routes: {
        'home': (context) => Home(),
        Weather.routeName: (context) => const Weather()
        // 'weather': (context) => Weather(),
      },
    );
  }
}

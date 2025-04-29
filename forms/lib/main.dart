import 'package:flutter/material.dart';
import 'package:forms/dates/task_inherited.dart';
import 'package:forms/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
 
  Widget build(BuildContext context) {
    return TaskInherited(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme:
                const AppBarTheme(color: Color.fromARGB(255, 184, 148, 190))),
        home: const Home(),
      ),
    );
  }
}

// class _MyAppState extends State<MyApp> {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(appBarTheme: AppBarTheme(color: const Color.fromARGB(255, 184, 148, 190))),
//       home: Scaffold(
//         appBar: AppBar(title: Text('Add new task'),),
//         body: TaskInherited(child: Home()),
//       ),
//     );
//   }
// }

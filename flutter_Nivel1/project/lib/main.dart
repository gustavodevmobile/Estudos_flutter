import 'package:flutter/material.dart';
import 'package:project/pages/home_pages.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.amber,
        )
      ),
      home: HomePage()
    );
  }
}

// ThemeData(
//  appBarTheme: const AppBarTheme(
//   shadowColor: Colors.transparent,
//   elevation: 0.0,
//   centerTitle: true,
//   color: Colors.grey,
//   titleTextStyle: TextStyle(
//     color: Colors.white,
//     fontSize: 20.0,
//     fontWeight: FontWeight.normal,
//   ),
//   systemOverlayStyle: SystemUiOverlayStyle(
//     statusBarColor: Colors.transparent,
//     statusBarIconBrightness: Brightness.light,
//     statusBarBrightness: Brightness.dark,
//    ),
//   )
// )
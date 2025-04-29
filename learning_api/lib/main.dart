import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_api/models/model.dart';
import 'package:learning_api/screens/add_datas/add_data.dart';
import 'package:learning_api/screens/home.dart';
import 'package:learning_api/services/services.dart';

void main() {
  runApp(const MyApp());

  Service service = Service();
  service.getAll();
  // service.register(Journal.empty());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
            iconTheme: IconThemeData(color: Colors.white)),
        textTheme: GoogleFonts.adaminaTextTheme(),
        useMaterial3: true,
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) => const Home(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == 'datas') {
          final Journal journal = settings.arguments as Journal;
          return MaterialPageRoute(builder: (context) {
            return AddDatas(journal: journal);
          });
        }
      },
    );
  }
}

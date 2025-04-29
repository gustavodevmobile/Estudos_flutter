import 'package:flutter/material.dart';
import 'package:learning_api/models/model.dart';
import 'package:learning_api/screens/home_screen/widgets/home_screen_list.dart';
import 'package:learning_api/services/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime currentDay = DateTime.now();
  int windowPage = 7;

  // A base de dados mostrada na lista
  Map<String, Journal> database = {};

  final ScrollController _listScrollController = ScrollController();

  Service service = Service();

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Título basado no dia atual
        title: Text(
          "${currentDay.day}  |  ${currentDay.month}  |  ${currentDay.year}",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  refresh();
                });
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: ListView(
        controller: _listScrollController,
        children: generateListJournalCards(
          windowPage: windowPage,
          currentDay: currentDay,
          database: database,
        ),
      ),
    );
  }

  void refresh() async {
    List<Journal> listJournal = await service.getAll();
    setState(() {
      database = {};
      for (Journal journal in listJournal) {
        database[journal.id] = journal;
      }
    });
  }
}

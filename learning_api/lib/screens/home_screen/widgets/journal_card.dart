import 'package:flutter/material.dart';

import 'package:learning_api/helpers/weekday.dart';
import 'package:learning_api/models/model.dart';
import 'package:uuid/uuid.dart';

class JournalCard extends StatelessWidget {
  final Journal? journal;
  final DateTime showedDate;
  const JournalCard({Key? key, this.journal, required this.showedDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (journal != null) {
      return InkWell(
        onTap: () {},
        child: Container(
          height: 115,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 75,
                    width: 75,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      border: Border(
                          right: BorderSide(color: Colors.black87),
                          bottom: BorderSide(color: Colors.black87)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      journal!.createdAt.day.toString(),
                      style: const TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 38,
                    width: 75,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.black87),
                      ),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text(WeekDay(journal!.createdAt.weekday).short),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    journal!.content,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          // callAddInJournal(context);
          Navigator.pushNamed(
            context,
            'datas',
            arguments: Journal(
              id: Uuid().v1(),
              content: '',
              createdAt: showedDate,
              updatedAt: showedDate,
            ),
          ).then((value) {
            if (value != null && value == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Salvo com sucesso'),
                ),
              );
            }
          });
        },
        child: Container(
          height: 115,
          alignment: Alignment.center,
          child: Text(
            "${WeekDay(showedDate.weekday).short} - ${showedDate.day}",
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  // callAddInJournal(BuildContext context) {
  //   Navigator.pushNamed(
  //     context,
  //     'datas',
  //     arguments: Journal(
  //       id: Uuid().v1(),
  //       content: '',
  //       createdAt: showedDate,
  //       updatedAt: showedDate,
  //     ),
  //   ).then((value) {
  //     if (value != null && value == true) {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(const SnackBar(content: Text('Salvo com sucesso')));
  //     }
  //   });
  // }
}

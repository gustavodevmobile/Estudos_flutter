import 'package:flutter/material.dart';
import 'package:learning_api/helpers/weekday.dart';
import 'package:learning_api/models/model.dart';
import 'package:learning_api/services/services.dart';

class AddDatas extends StatefulWidget {
  final Journal journal;
  AddDatas({required this.journal, super.key});

  @override
  State<AddDatas> createState() => _AddDatasState();
}

class _AddDatasState extends State<AddDatas> {
  final TextEditingController _contentControler = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              '${WeekDay(widget.journal.createdAt.weekday).long}, ${widget.journal.createdAt.day} / ${widget.journal.createdAt.month} / ${widget.journal.createdAt.year}'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () async {
                  widget.journal.content = _contentControler.text;
                  Service service = Service();
                  bool result = await service.register(widget.journal);
                  _contentControler.clear();
                  Navigator.pop(context, result);
                },
                icon: Icon(Icons.check)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _contentControler,
          keyboardType: TextInputType.multiline,
          style: const TextStyle(fontSize: 22),
          expands: true,
          maxLines: null,
          minLines: null,
        ),
      ),
    );
  }
}

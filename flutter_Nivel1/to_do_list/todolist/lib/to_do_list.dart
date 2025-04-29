import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  TextEditingController _textEditingController = TextEditingController();
  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              TextField(
                controller: _textEditingController,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  // decoration: BoxDecoration(color: Colors.green[100]),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(tasks[index]),
                        onLongPress: () {
                          setState(() {
                            tasks.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                if (_textEditingController.text.length > 0) {
                  setState(() {
                    tasks.add(_textEditingController.text);
                  });
                  _textEditingController.clear();
                }
                print(tasks);
              },
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                setState(() {
                  tasks = [];
                });
                _textEditingController.clear();

                print(tasks);
              },
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}

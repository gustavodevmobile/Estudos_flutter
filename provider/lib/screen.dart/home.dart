import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web/models/model1.dart';
import 'package:web/widgets/task_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TaskWidget(),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'screen1');
            },
            child: Text('NextPage'),
          )
        ],
      ),
      floatingActionButton:
          Consumer<Model1>(builder: (context, storedValue, child) {
        return FloatingActionButton(
          onPressed: () {
            storedValue.test('Teste');
          },
          child: Icon(Icons.add),
        );
      }),
    );
  }
}

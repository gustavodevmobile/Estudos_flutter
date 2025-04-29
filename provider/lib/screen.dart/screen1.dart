import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web/models/model1.dart';
import 'package:web/widgets/task_widget.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TaskWidget(),
            Consumer<Model1>(
              builder: (context, value, child) {
                return ElevatedButton(
                    onPressed: () {
                      value.test(value.contador().toString());
                    },
                    child: Text('Contador'));
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'screen2');
              },
              child: Text('Screen2'),
            ),
          ],
        ),
      ),
    );
  }
}

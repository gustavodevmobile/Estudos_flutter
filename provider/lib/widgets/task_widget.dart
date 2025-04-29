import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:web/models/model1.dart';

class TaskWidget extends StatelessWidget {
  // final Task task;
  // const TaskWidget(this.task);

  @override
  Widget build(BuildContext context) {
    return Consumer<Model1>(
      builder: (context, storedValue, child) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(storedValue.title),
          ),
        );
      },
    );
  }
}

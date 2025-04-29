import 'package:flutter/material.dart';
import 'package:forms/task.dart';

class TaskInherited extends InheritedWidget {
  @override
  final Widget child;
  TaskInherited({super.key, required this.child}) : super(child: child);

  final List<Task> taskList = [
    Task('Gustavo', './assets/st,small,507x507-pad,600x600,f8f8f8.jpg', 4)
  ];

  int teste = 0;

  void newTask(String name, String image, int type) {
    taskList.add(Task(name, image, type));
    teste = type;
    
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList != taskList;
  }
}

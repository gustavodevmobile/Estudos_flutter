import 'package:flutter/material.dart';
import 'package:web/widgets/task_widget.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen2'),
        
      ),
      body: Center(
        child:TaskWidget(),
      ),
    );
  }
}

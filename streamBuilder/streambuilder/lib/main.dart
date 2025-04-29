import 'dart:async';

import 'package:flutter/material.dart';
import 'package:streambuilder/service.dart';

void main() {
  runApp(MyTestStreamBuilder());
}

class MyTestStreamBuilder extends StatefulWidget {
  const MyTestStreamBuilder({super.key});

  @override
  State<MyTestStreamBuilder> createState() => _MyTestStreamBuilderState();
}

class _MyTestStreamBuilderState extends State<MyTestStreamBuilder> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StreamBuilder',
      home: MyTest(),
    );
  }
}

class MyTest extends StatefulWidget {
  const MyTest({super.key});

  @override
  State<MyTest> createState() => _MyTestState();
}

class _MyTestState extends State<MyTest> {
  Stream start() async* {
    await Future.delayed(Duration(seconds: 3));
    yield Container(
      width: 100,
      height: 100,
      color: Colors.amber,
    );
    await Future.delayed(Duration(seconds: 1));
    yield Container(
      width: 100,
      height: 100,
      color: Colors.blue,
    );
    await Future.delayed(Duration(seconds: 1));
    yield Service().getQuestions();
    await Future.delayed(Duration(seconds: 1));
    yield Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
    );
  }

  late final StreamController controller = StreamController(onListen: () async {
    if (!controller.isClosed) {
      controller.addStream(start());
    }

    if (!controller.isClosed) {
      controller.close();
    }
  });

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
            stream: start(),
            initialData: 3,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text('Erro ao buscar dados: ${snapshot.error}');
              } else {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.amber,
                      ),
                    );
                  case ConnectionState.waiting:
                    return Center(child: Text('loading...'));
                  case ConnectionState.active:
                    return Container();
                  case ConnectionState.done:
                    return snapshot.data;
                }
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

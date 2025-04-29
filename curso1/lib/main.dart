import 'package:flutter/material.dart';

void main() {
  runApp( MyApp()); 
}

class MyApp extends StatefulWidget {

  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacidade = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // elevatedButtonTheme: ElevatedButtonThemeData(style: TextButton.styleFrom(backgroundColor: Colors.blue))
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(
            color: Colors.black26,
          ),
          backgroundColor: Colors.blue,
          title: const Text('Tarefas'),
        ),
        body: AnimatedOpacity(
          opacity: opacidade ? 1 : 0,
          duration: const Duration(milliseconds: 800),
          child: ListView(children: [
            Task('Aprender Flutter', 'assets/Network_Alt_23225.png', 3),
            Task('Aprender Flutter', 'assets/01.jpeg', 4),
            Task('Aprender Flutter', 'assets/Ativo4.png', 5),
            Task('Aprender Flutter', 'assets/Network_Alt_23225.png', 2),
            Task('Aprender Flutter', 'assets/unnamed.jpg', 1),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
           setState(() {
              opacidade = !opacidade;
           });
          },child: Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String image;
  final int dificuldade;

  const Task(this.nome, this.image, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blue,
              ),
              height: 140,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Container(
                      child: LinearProgressIndicator(
                        color: Colors.amber,
                        value: nivel / 10,
                      ),
                      width: 200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7),
                    child: Text(
                      'Nível: $nivel',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all()),
                    width: 90,
                    height: 90,
                    child: ClipRRect(
                        // coloca borderRadius no proprio widget
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(widget.image)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        child: Text(
                          widget.nome,
                          style: const TextStyle(
                              fontSize: 25, overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                            color: (widget.dificuldade >= 1
                                ? Colors.yellow
                                : Colors.black26),
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                            color: (widget.dificuldade >= 2
                                ? Colors.yellow
                                : Colors.black26),
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                            color: (widget.dificuldade >= 3
                                ? Colors.yellow
                                : Colors.black26),
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                            color: (widget.dificuldade >= 4
                                ? Colors.yellow
                                : Colors.black26),
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                            color: (widget.dificuldade >= 5
                                ? Colors.yellow
                                : Colors.black26),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          nivel++;
                          if (nivel == 11) {
                            nivel = 0;
                          }
                        });
                        print(nivel);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.arrow_drop_up),
                          Text(
                            'Up',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        iconColor: Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(side: BorderSide.none),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

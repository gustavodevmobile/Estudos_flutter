import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:forms/dates/task_dao.dart';
import 'package:forms/dates/task_inherited.dart';
import 'package:forms/home.dart';

class Task extends StatefulWidget {
  final String nome;
  final String image;
  final int dificuldade;

  Task(this.nome, this.image, this.dificuldade, {super.key});
  int nivel = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool assetOrNetwork() {
    if (widget.image.contains('http')) {
      return false;
    }
    return true;
  }

  late int level;
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
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.amber,
                        value: widget.nivel / 10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7),
                    child: Text(
                      'Nível: ${widget.nivel}',
                      style: const TextStyle(color: Colors.black, fontSize: 20),
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
              margin: const EdgeInsets.all(2),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all()),
                      width: 90,
                      height: 90,
                      child: ClipRRect(
                          // coloca borderRadius no proprio widget
                          // borderRadius: BorderRadius.circular(40),
                          child: assetOrNetwork()
                              ? Image.asset(
                                  widget.image,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  widget.image,
                                  fit: BoxFit.cover,
                                )),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
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
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: ElevatedButton(
                        onLongPress: () {
                          TaskDao().delete(widget.nome);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => const AlertDialog(
                              title: Text('Tarefa Excluida!'),
                              content: Text('Clique em refresh para atualizar a tela.'),
                            ),
                          );
                        },
                        onPressed: () {
                          setState(() {
                            widget.nivel++;
                            setState(
                              () {},
                            );
                            if (widget.nivel == 11) {
                              widget.nivel = 0;
                            }
                            level = TaskInherited.of(context).teste;
                            print(level / 10);
                    
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          // iconColor: Color.fromARGB(255, 255, 255, 255),
                          shape: const RoundedRectangleBorder(side: BorderSide.none),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Icon(Icons.arrow_drop_up),
                            Text(
                              'Up',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
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

import 'package:draggable_and_tts/draggable_dynamic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class DraggableTts extends StatefulWidget {
  const DraggableTts({super.key});

  @override
  State<DraggableTts> createState() => _DraggableTtsState();
}

class _DraggableTtsState extends State<DraggableTts> {
  FlutterTts flutterTts = FlutterTts();
  String textInitial = 'Ligue a palavra com a cor correspondente';
  String textCorrect = 'Parabéns, você acertou!';
  String textAccepted = '';
  String textContent = 'Laranja';
  Color colorBox = Colors.black26;

  Future voice(String text) async {
    await flutterTts.setLanguage('pt-BR');
    await flutterTts.setPitch(0.8);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  @override
  void initState() {
    voice(textInitial);
    super.initState();
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Draggable com Tts',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              Text('Ligue a palavra com a cor correspondente:'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        voice('Laranja');
                      },
                      child: Draggable<String>(
                        data: textContent,
                        feedback: Material(
                          color: const Color.fromARGB(0, 255, 255, 255),
                          child: Text(
                            'Laranja',
                            style: TextStyle(fontSize: 13, color: Colors.black),
                          ),
                        ),
                        childWhenDragging: Container(
                          width: 85,
                          height: 40,
                          decoration: BoxDecoration(
                              color: colorBox,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Laranja',
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                          ),
                          //hild: Text('Draggable'),
                        ),
                        child: Container(
                          width: 85,
                          height: 40,
                          decoration: BoxDecoration(
                              color: colorBox,
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(width: 2, color: Colors.green)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Laranja',
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                          ),
                          //hild: Text('Draggable'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DragTarget<String>(
                      builder: (BuildContext context, accepted, rejected) {
                        return Container(
                          width: 90,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(child: Text(textAccepted)),
                        );
                      },
                      onAcceptWithDetails: (details) {
                        if (details.data == 'Laranja') {
                          setState(() {
                            textAccepted = details.data;
                            colorBox = Colors.orange;
                          });
                        }
                        voice(textCorrect);
                      },
                    ),
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DraggableDynamic()));
                  },
                  child: Text('Draggable dynamic'))
            ],
          ),
        ),
      ),
    );
  }
}

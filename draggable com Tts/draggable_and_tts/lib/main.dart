import 'package:draggable_and_tts/draggable_tts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const TestWithTts(),
    );
  }
}

class TestWithTts extends StatefulWidget {
  const TestWithTts({super.key});

  @override
  State<TestWithTts> createState() => _TestWithTtsState();
}

class _TestWithTtsState extends State<TestWithTts> {
  final FlutterTts flutterTts = FlutterTts();
  TextEditingController controller = TextEditingController();

  Future speak(String text) async {
    await flutterTts.setLanguage('pt-BR');
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(0.8);
    await flutterTts.speak(text);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste com Tts'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Digite algo',
                ),
                controller: controller,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                speak(controller.text);
              },
              child: Text('Speech'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DraggableTts()));
                },
                child: Text('Draggable com Tts'))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:forms/dates/task_dao.dart';
import 'package:forms/task.dart';

class TF_TFF extends StatefulWidget {
  const TF_TFF({required this.taskContext, super.key});

  final BuildContext taskContext;

  @override
  State<TF_TFF> createState() => _TF_TFFState();
}

class _TF_TFFState extends State<TF_TFF> {
  TextEditingController name = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController type = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool typeValidator(String? value) {
    if ((value != null && value.isEmpty) ||
        (int.parse(value!) > 5 || int.parse(value) < 1)) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TextField e TextFormField'),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2)),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                // TextField(
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     hintText: 'Enter text',
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: name,
                    validator: (String? value) {
                      if (valueValidator(value)) {
                        return 'Por favor, preencha este campo.';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        fillColor: Colors.white70,
                        filled: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (typeValidator(value)) {
                        return 'Por favor, insira um número entre 1 e 5.';
                      }
                      return null;
                    },
                    controller: type,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Tipo',
                        fillColor: Colors.white70,
                        filled: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autofocus: true,
                    validator: (value) {
                      if (valueValidator(value)) {
                        return 'Por favor, insira uma URL válida.';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.url,
                    controller: image,
                    onChanged: (image) {},
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'URL da magem',
                        fillColor: Colors.white70,
                        filled: true),
                  ),
                ),
                Center(
                  child: Container(
                      width: 72,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.purple[900],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2, color: Colors.blue)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            image.text,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) =>
                                Center(
                                    child: Image.asset('./assets/nophoto.png')),
                          ))),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        TaskDao().save(
                          Task(
                            name.text,
                            image.text,
                            int.parse(type.text),
                          ),
                        );
                        // TaskInherited.of(widget.taskContext).newTask(
                        //   name.text,
                        //   image.text,
                        //   int.parse(type.text),
                        // );
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor:
                                    Color.fromARGB(255, 169, 230, 171),
                                content: Text(
                                  'Informação enviada',
                                  style: TextStyle(color: Colors.black),
                                )));
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Adicionar')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

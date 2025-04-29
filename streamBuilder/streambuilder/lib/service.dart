import 'dart:convert';

import 'package:http/http.dart' as http;

class Service {
  Future<List> getQuestions() async {
    List list = [];

    http.Response response = await http.get(
      Uri.parse('http://192.168.56.2:8080/questoes'),
    );
    try {
      if (response.statusCode == 200) {
        list = await json.decode(response.body);
        print('Questões recebidas com sucesso');
        for (var questions in list) {
          print(questions);
        }
      }
    } catch (err) {
      print('Erro ao buscar questões: $err');
    }

    return list;
  }
}

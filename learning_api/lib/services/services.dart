import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:learning_api/models/model.dart';
import 'package:learning_api/services/http_interceptor.dart';

// class Model {
//   final String country;
//   final DateTime date;
//   final String text;

//   Model({required this.country, required this.date, required this.text});
// }

// class Service2 {
//   static const String url =
//       'http://apiadvisor.climatempo.com.br';
//   static const String resource =
//       '/api/v1/anl/synoptic/locale/BR?token=4f333ec5533af8727e01a68af8b770e7';

//   String getUrl2() {
//     return '$url$resource';
//   }

//   Future<String> getAllApi() async {
//    http.Response response = await http.get(Uri.parse(getUrl2()));
//     if (response.statusCode != 200) {
//       throw Exception('Failed to load data from the server');
//     }
//     print(response.body);
//     return response.body;
//   }
// }

class Service {
  static const String url = "http://192.168.0.152:3000/";
  static const String resource = "journals";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggerInterceptor()]);

  String gerUrl() {
    return "$url$resource";
  }

  Future<bool> register(Journal journal) async {
    String jsonJournal = json.encode(journal.toMap());
    http.Response response = await client.post(
      Uri.parse(gerUrl()),
      headers: {'Content-Type': 'aplication/json'},
      body: jsonJournal,
    );
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<List<Journal>> getAll() async {
    http.Response response = await client.get(Uri.parse(gerUrl()));
    if (response.statusCode != 200) {
      throw Exception('Failed to load data from the server');
    }
    List<Journal> list = [];
    List<dynamic> listDynamic = json.decode(response.body);

    for (var jsonMap in listDynamic) {
      list.add(Journal.fromMap(jsonMap));
    }

    return list;
  }

  // https://dev.to/feministech/manipulando-listas-e-mapas-no-flutter-81h

  //  Future<String> getAll() async {
  //   http.Response response = await client.get(Uri.parse(gerUrl()));
  //   if (response.statusCode != 200) {
  //     throw Exception('Failed to load data from the server');
  //   }
  //   print(response.body);
  //   return response.body;
  // }
}

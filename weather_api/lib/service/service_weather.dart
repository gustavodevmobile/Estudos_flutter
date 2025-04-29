import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wheater_api/models/model_weather.dart';

class ServiceWeather {
  static const String _apiKey = 'b1675c3e9c0a28a116220edb4ab942fc';
  static const String location = 'Santos';
  static const String url = 'http://api.weatherstack.com';
  static const String resource = '/current?access_key=$_apiKey&query=$location';

  String getApi() {
    return '$url$resource';
  }

  // Fetch weather data from the API and return it as a list of ModelWeather objects.
  Future<List> getRequest() async {
    http.Response response = await http.get(Uri.parse(getApi()));
    if (response.statusCode != 200) {
      throw Exception('Falha na requisição');
    }
    Map<String, dynamic> mapRequest = json.decode(response.body);

    ModelWeather models = ModelWeather(
      state: mapRequest['location']['region'],
      city: mapRequest['location']['name'],
      temperature: mapRequest['current']['temperature'],
      humidity: mapRequest['current']['humidity'],
      windSpeed: mapRequest['current']['wind_speed'],
      weatherCode: mapRequest['current']['weather_code'],
    );
    List<dynamic> listModelWeather = [];
    Map<String, dynamic> modelMap = models.toMap();

    for (var map in modelMap.values) {
      listModelWeather.add(map);
    }
    print(listModelWeather);
    print(response.body);
    return listModelWeather;
  }
}

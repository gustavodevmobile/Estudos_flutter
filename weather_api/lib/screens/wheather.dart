import 'package:flutter/material.dart';
import 'package:wheater_api/main.dart';

import 'package:wheater_api/service/service_weather.dart';
import 'package:wheater_api/widgets/card_weather.dart';

class Weather extends StatefulWidget {
  static const routeName = 'weather';

  const Weather({
    super.key,
  });

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final Future<List> _future = ServiceWeather().getRequest();

  String imageWeather = '';
  String descriptionWeather = '';
  String description(String code) {
    switch (code) {
      case '113':
        imageWeather = './assets/imagens/ensolarado.png';
        descriptionWeather = 'Ensolarado';
        break;
      case '116':
        imageWeather = './assets/imagens/sol_entre_nuvens.png';
        descriptionWeather = 'Sol entre nuvens';
        break;
      case '119':
        imageWeather = './assets/imagens/sol_entre_nuvens.png';
        descriptionWeather = 'Sol entre nuvens e chuva';
        break;
      case '122':
        imageWeather = './assets/imagens/nublado.png';
        descriptionWeather = 'Nublado';
        break;

      default:
        './assets/imagens/chuva.png';
        descriptionWeather = 'Chuva';
    }
    print(imageWeather);
    return imageWeather;
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Previsão do Tempo'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  Text('${arguments.countRequest.toString()} / 250'),
                  Text(
                    'Requisições',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: FutureBuilder<List>(
          future: _future,
          builder: (context, snapshot) {
            print(snapshot.data);
            

            List? forecast = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Center(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        strokeAlign: 25,
                      ),
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasData && forecast != null) {
              if (forecast.isNotEmpty) {
                description(forecast[5].toString());
                return Column(
                  children: [
                    // Text(apiRequest.toString()),
                    CardWeather(
                        forecast[0],
                        forecast[1],
                        forecast[2].toString(),
                        forecast[3].toString(), 
                        forecast[4].toString(),
                        imageWeather,
                        descriptionWeather)
                  ],
                );
              }
              return Text(
                'No Contacts found',
                style: TextStyle(fontSize: 32),
              );
            }
            return Text('Error to loading forecast');
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CardWeather extends StatefulWidget {
  final String state;
  final String city;
  final String temperature;
  final String humidity;
  final String windSpeed;
  final String weatherCode;
  final String weatherDescription;

  const CardWeather(this.state, this.city, this.temperature, this.humidity,
      this.windSpeed, this.weatherCode, this.weatherDescription,
      {super.key});

  @override
  State<CardWeather> createState() => _CardWeatherState();
}

class _CardWeatherState extends State<CardWeather> {
  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.city, style: TextStyle(fontSize: 70)),
              Text(widget.state),
              Text(widget.weatherDescription),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 150,
                        height: 150,
                        child: Image.asset(widget.weatherCode),
                      )

                      // Image.asset(
                      //   widget.weatherCode,
                      // ),
                      ),
                  Text(
                    '${widget.temperature}°',
                    style: TextStyle(fontSize: 80),
                  )
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.all(10),
                // width: MediaQuery.of(context).size.width,
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Humidade do ar'),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: '${widget.humidity}',
                          style: TextStyle(fontSize: 80, color: Colors.black)),
                      TextSpan(
                          text: '%',
                          style: TextStyle(fontSize: 30, color: Colors.black))
                    ]),
                  )
                ],
              ),
            ),
            Container(
              width: 170,
              margin: EdgeInsets.all(10),
              height: 170,
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Velocidade do vento'),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: '${widget.windSpeed}',
                          style: TextStyle(fontSize: 80, color: Colors.black)),
                      TextSpan(
                          text: 'Km/h',
                          style: TextStyle(fontSize: 15, color: Colors.black))
                    ]),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

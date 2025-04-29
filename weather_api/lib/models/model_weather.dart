class ModelWeather {
  final String state;
  final String city;

  final int temperature;
  final int humidity;
  final int windSpeed;
  final int weatherCode;

  ModelWeather({
    required this.state,
    required this.city,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.weatherCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'State': state,
      'City': city,
      'Temperature': temperature,
      'Humidity': humidity,
      'Wind Speed': windSpeed,
      'Weather Code': weatherCode,
    };
  }

  @override
  String toString() {
    return 'ModelWeather{state: $state, city: $city, temperature: $temperature, humidity: $humidity, windSpeed: $windSpeed, weatherCode: $weatherCode,}';
  }
}

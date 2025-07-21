import '../../../daily_weather/data/models/day_model.dart';

class WeatherModel {
  final String cityName;
  final String lon;
  final String lat;
  final String temp;
  final int isDay;
  final String weatherCondition;
  final String windSpeed;
  final String humidity;
  final String cloud;
  final String vision;
  final List<Day> days;

  WeatherModel({
    required this.cityName,
    required this.lon,
    required this.lat,
    required this.temp,
    required this.isDay,
    required this.weatherCondition,
    required this.windSpeed,
    required this.humidity,
    required this.cloud,
    required this.vision,
    required this.days,
  });

  factory WeatherModel.fromJson(jsonData) {
    return WeatherModel(
      cityName: jsonData['location']['name'],
      lon: jsonData['location']['lon'].toString(),
      lat: jsonData['location']['lat'].toString(),
      temp: jsonData['current']['temp_c'].toString(),
      isDay: jsonData['current']['is_day'],
      weatherCondition: jsonData['current']['condition']['text'],
      windSpeed: jsonData['current']['wind_kph'].toString(),
      humidity: jsonData['current']['humidity'].toString(),
      cloud: jsonData['current']['cloud'].toString(),
      vision: jsonData['current']['vis_km'].toString(),
      days: setDays(jsonData['forecast']['forecastday']),
    );
  }

  factory WeatherModel.dummy() {
    return WeatherModel(
      cityName: 'cairo',
      lon: '30.05',
      lat: '31.25',
      temp: '20',
      isDay: 1,
      weatherCondition: 'sunny',
      windSpeed: '20',
      humidity: '20',
      cloud: '20',
      vision: '20',
      days: [],
    );
  }
}

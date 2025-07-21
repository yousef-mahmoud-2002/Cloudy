import 'package:intl/intl.dart';
import 'hour_model.dart';

class Day {
  final String dayOfWeek;
  final String temp;
  final String windSpeed;
  final String vision;
  final String humidity;
  final String chanceOfRain;
  final String chanceOfSnow;
  final String weatherCondition;
  final String moonCondition;
  final List<Hour> hours;

  Day({
    required this.dayOfWeek,
    required this.temp,
    required this.windSpeed,
    required this.vision,
    required this.humidity,
    required this.chanceOfRain,
    required this.chanceOfSnow,
    required this.weatherCondition,
    required this.moonCondition,
    required this.hours,
  });

  factory Day.fromJson(jsonData) {
    return Day(
      dayOfWeek: setDayOfWeek([jsonData['date']]),
      temp: jsonData['day']['avgtemp_c'].toString(),
      windSpeed: jsonData['day']['maxwind_kph'].toString(),
      vision: jsonData['day']['avgvis_km'].toString(),
      humidity: jsonData['day']['avghumidity'].toString(),
      chanceOfRain: jsonData['day']['daily_chance_of_rain'].toString(),
      chanceOfSnow: jsonData['day']['daily_chance_of_snow'].toString(),
      weatherCondition: jsonData['day']['condition']['text'],
      moonCondition: jsonData['astro']['moon_illumination'].toString(),
      hours: setHours(jsonData['hour']),
    );
  }

  factory Day.dummy() {
    return Day(
      dayOfWeek: '',
      temp: '',
      windSpeed: '',
      vision: '',
      humidity: '',
      chanceOfRain: '',
      chanceOfSnow: '',
      weatherCondition: '',
      moonCondition: '',
      hours: [],
    );
  }
}

String setDayOfWeek(List<String> date) {
  String dayOfWeek = '';
  for (var element in date) {
    DateTime date = DateFormat('yyyy-MM-dd').parse(element);
    dayOfWeek = DateFormat('EEEE').format(date);
  }

  return dayOfWeek;
}

List<Day> setDays(jsonData) {
  List<Day> days = [];
  for (var element in jsonData) {
    Day day = Day.fromJson(element);

    days.add(day);
  }
  return days;
}

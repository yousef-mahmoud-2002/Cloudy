import 'package:flutter/material.dart';

MaterialColor getWeatherColor(String condition) {
  switch (condition.toLowerCase()) {
    case "sunny":
      return Colors.amber;

    case "partly cloudy":
      return Colors.lightBlue;

    case "cloudy":
    case "overcast":
    case "clear":
      return Colors.blueGrey;

    case "mist":
    case "fog":
      return Colors.grey;

    case "patchy rain possible":
    case "light rain":
    case "patchy light rain":
    case "light rain shower":
      return Colors.blue;

    case "moderate rain":
    case "heavy rain":
    case "heavy rain at times":
    case "moderate or heavy rain shower":
    case "torrential rain shower":
      return Colors.indigo;

    case "patchy snow possible":
    case "patchy light snow":
    case "light snow":
    case "light snow showers":
      return Colors.lightBlue;

    case "moderate snow":
    case "heavy snow":
    case "patchy heavy snow":
    case "moderate or heavy snow showers":
      return Colors.blueGrey;

    case "thundery outbreaks possible":
    case "patchy light rain with thunder":
    case "moderate or heavy rain with thunder":
      return Colors.deepPurple;

    case "light sleet":
    case "light sleet showers":
    case "ice pellets":
    case "light showers of ice pellets":
      return Colors.cyan;

    case "patchy light snow with thunder":
    case "moderate or heavy snow with thunder":
      return Colors.deepPurple;

    case "patchy freezing drizzle possible":
    case "freezing fog":
    case "light freezing rain":
    case "freezing drizzle":
    case "patchy sleet possible":
    case "light drizzle":
      return Colors.blue;

    case "blowing snow":
    case "blizzard":
      return Colors.grey;

    default:
      return Colors.blue;
  }
}

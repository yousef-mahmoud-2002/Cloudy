import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../../../core/utils/get_weather_color.dart';

class WeatherDetailsBack extends StatelessWidget {
  const WeatherDetailsBack({super.key, required this.condition});

  final String condition;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.9,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              getWeatherColor(condition),
              getWeatherColor(condition)[300]!,
              getWeatherColor(condition)[50]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}

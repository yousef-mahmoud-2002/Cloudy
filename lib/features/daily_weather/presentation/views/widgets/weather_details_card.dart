import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/get_weather_image.dart';
import '../../../data/models/day_model.dart';

class WeatherDetailsCard extends StatelessWidget {
  const WeatherDetailsCard({super.key, required this.day});

  final Day day;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: kThirdColor,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: kPrimaryColor,
                blurRadius: 12,
                spreadRadius: 6,
              ),
            ],
          ),
          child: Row(
            children: [
              const Spacer(),
              Text(
                day.temp,
                style: const TextStyle(
                  fontSize: 80,
                  color: Colors.white70,
                ),
              ),
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  'o',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -40,
          left: 40,
          child: Image.asset(
            getWeatherImage(day.weatherCondition),
            width: 130,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 22),
          child: Text(
            day.weatherCondition,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
        ),
      ],
    );
  }
}

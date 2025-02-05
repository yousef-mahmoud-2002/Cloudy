import 'package:cloudy/constants.dart';
import 'package:flutter/material.dart';
import '../../../data/models/day_model.dart';

class WeatherDailyStates extends StatelessWidget {
  const WeatherDailyStates({super.key, required this.day});

  final Day day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DailyState(
            image: 'assets/vision.png',
            label: 'vision',
            value: '${day.vision} km',
          ),
          DailyState(
            image: 'assets/windspeed.png',
            label: 'Wind',
            value: '${day.windSpeed} km/h',
          ),
          DailyState(
            image: 'assets/humidity.png',
            label: 'Hum',
            value: '${day.humidity} %',
          ),
          DailyState(
            image: 'assets/moon.png',
            label: 'Moon',
            value: '${day.moonCondition} %',
          ),
        ],
      ),
    );
  }
}

class DailyState extends StatelessWidget {
  const DailyState({
    super.key,
    required this.label,
    required this.value,
    required this.image,
  });

  final String label;
  final String value;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: kPrimaryColor,
                blurRadius: 6,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: Image.asset(image),
        ),
        const SizedBox(height: 12),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

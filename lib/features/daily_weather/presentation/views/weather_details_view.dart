import 'package:cloudy/constants.dart';
import 'package:cloudy/features/daily_weather/presentation/views/widgets/chance_of_text.dart';
import 'package:flutter/material.dart';
import '../../data/models/day_model.dart';
import 'widgets/weather_daily_states.dart';
import 'widgets/weather_details_back.dart';
import 'widgets/weather_details_card.dart';
import 'widgets/weather_day_hours.dart';

class WeatherDetailsView extends StatelessWidget {
  const WeatherDetailsView({super.key, required this.day});

  final Day day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text(
          day.dayOfWeek,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          WeatherDetailsBack(condition: day.weatherCondition),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WeatherDailyStates(day: day),
              const Spacer(flex: 2),
              WeatherDetailsCard(day: day),
              const Spacer(),
              ChanceOfText(day: day),
              const Spacer(),
              WeatherDayHours(hours: day.hours),
            ],
          ),
        ],
      ),
    );
  }
}

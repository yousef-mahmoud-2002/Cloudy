import 'package:cloudy/features/daily_weather/data/models/hour_model.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/get_weather_color.dart';
import '../../../../../core/utils/get_weather_image.dart';

class WeatherDayHours extends StatelessWidget {
  const WeatherDayHours({super.key, required this.hours});

  final List<Hour> hours;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Text(
              'Day Hours :',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.separated(
            itemCount: 24,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 16);
            },
            itemBuilder: (BuildContext context, int index) {
              return HoursBody(hour: hours[index]);
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class HoursBody extends StatelessWidget {
  const HoursBody({super.key, required this.hour});

  final Hour hour;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [
            getWeatherColor(hour.condition),
            getWeatherColor(hour.condition)[300]!,
            getWeatherColor(hour.condition)[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.center,
        ),
      ),
      child: Column(
        children: [
          const Spacer(),
          Image.asset(
            getWeatherImage(hour.condition),
            height: 40,
          ),
          const Spacer(),
          Text(
            '${hour.temp} C',
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          const Divider(height: 0, thickness: 1, color: kPrimaryColor),
          Container(
            height: 40,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Text(
              hour.time,
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

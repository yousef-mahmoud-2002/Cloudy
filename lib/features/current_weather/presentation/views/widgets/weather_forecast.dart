import 'package:cloudy/constants.dart';
import 'package:cloudy/core/utils/animate_navigation_route.dart';
import 'package:cloudy/features/daily_weather/data/models/day_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/get_weather_color.dart';
import '../../../../../core/utils/get_weather_image.dart';
import '../../../../daily_weather/presentation/views/weather_details_view.dart';
import '../../manager/weather_cubit/weather_cubit.dart';

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    var days = BlocProvider.of<WeatherCubit>(context).weatherModel.days;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                'Next 3 Days',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List<Widget>.generate(
              days.length,
              (index) {
                return ForecastBody(day: days[index]);
              },
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Tap to view day\'s weather details',
            style: TextStyle(
              fontSize: 16,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ForecastBody extends StatelessWidget {
  const ForecastBody({super.key, required this.day});

  final Day day;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, animateRoute(WeatherDetailsView(day: day), 2));
      },
      child: Container(
        height: 140,
        width: 90,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: kPrimaryColor,
              blurRadius: 5,
              offset: Offset(4, 4),
            ),
          ],
          gradient: LinearGradient(
            colors: [
              getWeatherColor(day.weatherCondition),
              getWeatherColor(day.weatherCondition)[300]!,
              getWeatherColor(day.weatherCondition)[50]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.center,
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            Image.asset(getWeatherImage(day.weatherCondition), height: 40),
            const Spacer(),
            Text(
              '${day.temp} C',
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Container(
              height: 35,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Text(
                day.dayOfWeek,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cloudy/core/utils/get_weather_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants.dart';
import '../../manager/weather_cubit/weather_cubit.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<WeatherCubit>(context).weatherModel;
    return Stack(
      alignment: Alignment.bottomLeft,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: kSecondaryColor,
                blurRadius: 12,
                spreadRadius: 6,
              ),
            ],
          ),
          child: Row(
            children: [
              const Spacer(),
              Text(
                weatherModel.temp,
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
          top: -30,
          left: 15,
          child: Image.asset(
            getWeatherImage(weatherModel.weatherCondition),
            width: 130,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            weatherModel.weatherCondition,
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

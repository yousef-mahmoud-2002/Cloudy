import 'package:cloudy/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/weather_cubit/weather_cubit.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<WeatherCubit>(context).weatherModel;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CurrentBody(
            label: 'Vision',
            image: 'assets/vision.png',
            value: '${weatherModel.vision} km',
          ),
          CurrentBody(
            label: 'Wind',
            image: 'assets/windspeed.png',
            value: '${weatherModel.windSpeed} km/h',
          ),
          CurrentBody(
            label: 'Hum',
            image: 'assets/humidity.png',
            value: '${weatherModel.humidity} %',
          ),
          CurrentBody(
            label: 'Clouds',
            image: 'assets/lightcloud.png',
            value: '${weatherModel.cloud} %',
          ),
        ],
      ),
    );
  }
}

class CurrentBody extends StatelessWidget {
  const CurrentBody({
    super.key,
    required this.label,
    required this.image,
    required this.value,
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

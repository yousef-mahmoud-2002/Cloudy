import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../manager/weather_cubit/weather_cubit.dart';
import 'widgets/weather_forecast.dart';
import 'widgets/weather_header.dart';
import 'widgets/weather_card.dart';
import 'widgets/current_weather.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel = context.watch<WeatherCubit>().weatherModel;
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is WeatherLoading,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    weatherModel.isDay == 1
                        ? Colors.amberAccent
                        : Colors.black54,
                    Colors.white,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.centerLeft,
                ),
              ),
              child: const SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      WeatherHeader(),
                      Spacer(flex: 2),
                      WeatherCard(),
                      Spacer(),
                      CurrentWeather(),
                      Spacer(),
                      WeatherForecast(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

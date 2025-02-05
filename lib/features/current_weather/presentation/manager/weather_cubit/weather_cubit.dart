import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/weather_service.dart';
import '../../../../daily_weather/data/models/day_model.dart';
import '../../../data/models/weather_model.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  late WeatherModel weatherModel = WeatherModel(
    cityName: 'cityName',
    lon: 'lon',
    lat: 'lat',
    temp: 'temp',
    isDay: 0,
    weatherCondition: 'clear',
    windSpeed: 'windSpeed',
    humidity: 'humidity',
    cloud: 'cloud',
    vision: 'vision',
    days: [day, day, day],
  );
  Day day = Day(
    dayOfWeek: 'date',
    temp: 'avgTemp',
    windSpeed: 'windSpeed',
    vision: 'vision',
    humidity: 'humidity',
    moonCondition: '12',
    chanceOfRain: 'chanceOfRain',
    chanceOfSnow: 'chanceOfSnow',
    weatherCondition: 'weatherCondition',
    hours: [],
  );

  Future<WeatherModel> getWeather(String cityName) async {
    try {
      emit(WeatherLoading());
      weatherModel = await WeatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess());
      return weatherModel;
    } on Exception catch (e) {
      emit(WeatherFailure(error: e.toString()));
      return weatherModel;
    }
  }
}

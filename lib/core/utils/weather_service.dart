import 'package:dio/dio.dart';
import '../../features/current_weather/data/models/weather_model.dart';

class WeatherService {
  static const String baseUrl = 'https://api.weatherapi.com/v1';
  static const String apiKey = '106d5f0f4eb04a1086a194733242010';

  static Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await Dio().get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=3',
      );

      WeatherModel weathermodel = WeatherModel.fromJson(response.data);

      return weathermodel;
    } on DioException catch (e) {
      final String errorMasessage = e.response?.data['error']['Mesage'] ??
          'oops there an error ,try later';

      throw Exception(errorMasessage);
    } catch (e) {
      throw Exception('Error');
    }
  }
}

import 'package:cloudy/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/animate_navigation_route.dart';
import '../../../../current_weather/presentation/manager/weather_cubit/weather_cubit.dart';
import '../../../../current_weather/presentation/views/weather_view.dart';

class CityField extends StatefulWidget {
  const CityField({super.key});

  @override
  State<CityField> createState() => _CityFieldState();
}

class _CityFieldState extends State<CityField> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<WeatherCubit>(context).getWeather(controller.text);
        Navigator.push(context, animateRoute(const WeatherView(), 2));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'By city',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 40,
            width: 90,
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                filled: true,
                fillColor: kSecondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

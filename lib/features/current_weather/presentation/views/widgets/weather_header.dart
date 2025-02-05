import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/animate_navigation_route.dart';
import '../../manager/weather_cubit/weather_cubit.dart';
import '../search_view.dart';

class WeatherHeader extends StatelessWidget {
  const WeatherHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<WeatherCubit>(context).weatherModel;
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weatherModel.cityName,
                  style: const TextStyle(
                    fontSize: 30,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/pin.png',
                      height: 12,
                      color: Colors.red,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${weatherModel.lon} , ${weatherModel.lat}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    animateRoute(SearchView(isDay: weatherModel.isDay), 2));
              },
              child: const Icon(Icons.search, size: 40),
            ),
          ],
        )
      ],
    );
  }
}

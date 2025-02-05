import 'package:cloudy/features/current_weather/presentation/manager/weather_cubit/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.isDay});

  final int isDay;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Search for weather forecast'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              isDay == 1 ? Colors.amberAccent : Colors.black54,
              Colors.white,
            ],
            begin: Alignment.topRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      controller: controller,
                      onSubmitted: (value) {
                        BlocProvider.of<WeatherCubit>(context)
                            .getWeather(value.trim());
                        Navigator.pop(context);
                      },
                      decoration: const InputDecoration(
                        hintText: 'Search by city name',
                        hintStyle: TextStyle(fontSize: 20, color: Colors.black),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 12),
                    child: InkWell(
                      onTap: () {
                        BlocProvider.of<WeatherCubit>(context)
                            .getWeather(controller.text.trim());
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.search,
                        size: 34,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

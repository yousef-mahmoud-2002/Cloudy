import 'package:cloudy/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/current_weather/presentation/manager/weather_cubit/weather_cubit.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: MaterialApp(
        title: 'Cloudy',
        home: const SplashView(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          
          useMaterial3: false,
          appBarTheme: const AppBarTheme(color: kPrimaryColor),
        ),
      ),
    );
  }
}

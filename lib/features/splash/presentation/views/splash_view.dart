import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import '../../../../core/utils/animate_navigation_route.dart';
import '../../../current_weather/presentation/manager/weather_cubit/weather_cubit.dart';
import '../../../current_weather/presentation/views/weather_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Location location = Location();
  late bool serviceEnabled;
  late PermissionStatus permissionGranted;
  late LocationData locationData;

  @override
  void initState() {
    onOpen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 100),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              setTheme() ? Colors.amberAccent : Colors.black54,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              setTheme() ? 'assets/clear.png' : 'assets/moon.png',
              height: 175,
            ),
            const SizedBox(height: 150),
            const Text(
              'Binding to location data',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              color: setTheme() ? Colors.blueGrey.shade400 : Colors.amber,
              backgroundColor:
                  setTheme() ? Colors.amber : Colors.blueGrey.shade400,
            ),
          ],
        ),
      ),
    );
  }

  void onOpen(context) async {
    serviceEnabled = await location.serviceEnabled();
    permissionGranted = await location.hasPermission();
    if (serviceEnabled) {
      if (permissionGranted == PermissionStatus.granted ||
          permissionGranted == PermissionStatus.grantedLimited) {
        locationData = await location.getLocation();
        String lon = locationData.longitude.toString();
        String lat = locationData.latitude.toString();

        BlocProvider.of<WeatherCubit>(context).getWeather('$lat,$lon');
        Navigator.pushReplacement(
            context, animateRoute(const WeatherView(), 2));
      } else {
        checkPermission(context);
      }
    } else {
      checkService(context);
    }
  }

  void checkService(context) async {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You should enable location service to continue'),
        ),
      );
    }
    onOpen(context);
  }

  void checkPermission(context) async {
    permissionGranted = await location.requestPermission();
    if (permissionGranted == PermissionStatus.denied) {
      return;
    }

    onOpen(context);
  }

  bool setTheme() {
    if (TimeOfDay.now().hour >= 6 && TimeOfDay.now().hour < 18) {
      return true;
    } else {
      return false;
    }
  }
}

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
  final Location location = Location();
  late bool serviceEnabled;
  late PermissionStatus permissionGranted;
  late LocationData locationData;

  bool isLoading = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final isDay = isDayTime();

    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 100),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [isDay ? Colors.amberAccent : Colors.black54, Colors.white],
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              isDay ? 'assets/clear.png' : 'assets/moon.png',
              height: 300,
              fit: BoxFit.cover,
            ),
            const Spacer(),
            if (errorMessage != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  errorMessage!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            const Spacer(),
            if (!isLoading)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: isDay ? Colors.amber : Colors.blueGrey,
                  foregroundColor: isDay ? Colors.blueGrey : Colors.amber,
                ),
                onPressed: () => onGetLocationPressed(context),
                child: const Text(
                  'Get Location',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            if (isLoading) ...[
              const Text(
                'Fetching your location...',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: LinearProgressIndicator(
                  color: isDay ? Colors.blueGrey.shade400 : Colors.amber,
                  backgroundColor:
                      isDay ? Colors.amber : Colors.blueGrey.shade400,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void onGetLocationPressed(BuildContext context) {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    getLocationData(context);
  }

  Future<void> getLocationData(BuildContext context) async {
    try {
      try {
        serviceEnabled = await location.serviceEnabled();
      } catch (e) {
        onError('There was an error with enabling location service');
        return;
      }

      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          onError('Enable location service to use this app');
          return;
        }
      }

      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted &&
            permissionGranted != PermissionStatus.grantedLimited) {
          onError('Grant location permission to use this app');
          return;
        }
      } else if (permissionGranted == PermissionStatus.deniedForever) {
        onError('Grant location permission from settings to use this app');
        return;
      }

      locationData = await location.getLocation();
      final lat = locationData.latitude;
      final lon = locationData.longitude;

      if (lat == null || lon == null) {
        onError(
            'There was an error while getting location data, try again later');
        return;
      }

      if (context.mounted) {
        BlocProvider.of<WeatherCubit>(context).getWeather('$lat,$lon');
        Navigator.pushReplacement(
          context,
          animateRoute(const WeatherView(), 2),
        );
      }
    } catch (e) {
      onError(
          'There was an error while getting location data, try again later');
    }
  }

  void onError(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            content: Center(child: Text(message)),
            duration: const Duration(milliseconds: 1200),
          ),
        )
        .closed
        .then((value) {
      setState(() {
        isLoading = false;
        errorMessage = message;
      });
    });
  }

  bool isDayTime() {
    final hour = TimeOfDay.now().hour;
    return hour >= 6 && hour < 18;
  }
}

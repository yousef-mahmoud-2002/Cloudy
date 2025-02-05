import 'package:flutter/material.dart';

import '../../../data/models/day_model.dart';

class ChanceOfText extends StatelessWidget {
  const ChanceOfText({super.key, required this.day});

  final Day day;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        setChance(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  String setChance() {
    if (day.chanceOfRain != '0') {
      return 'chance of rain : ${day.chanceOfRain} %';
    } else if (day.chanceOfSnow != '0') {
      return 'chance of snow : ${day.chanceOfSnow} %';
    } else {
      return 'No chance of rain or snow';
    }
  }
}

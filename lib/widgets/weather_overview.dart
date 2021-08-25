import 'package:flutter/material.dart';
import 'package:hko_weather/hko_weather.dart';

class WeatherOverview extends StatelessWidget {
  final WeatherStation selectedStation;
  final String generalInfo;

  const WeatherOverview({
    Key? key,
    required this.selectedStation,
    required this.generalInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(); // TODO: Weather Overview
  }
}

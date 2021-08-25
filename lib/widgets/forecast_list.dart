import 'package:flutter/material.dart';
import 'package:hko_weather/hko_weather.dart';
import 'package:weather/themes.dart';

class ForecastList extends StatelessWidget {
  final List<Forecast> forecasts;

  const ForecastList({
    Key? key,
    required this.forecasts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(); // TODO: Forecast List
  }
}

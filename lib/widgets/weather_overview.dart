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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Image.network(
            selectedStation.weatherStatus.getIconLink(),
            height: 40,
          ),
          Text(
            "${selectedStation.temperature.value}°",
            style: Theme.of(context).textTheme.headline1,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            // Shrink the width as small as possible
            children: [
              Icon(
                Icons.beach_access_rounded,
                size: 16,
                color: Theme.of(context).textTheme.subtitle1!.color,
              ),
              SizedBox(width: 4),
              Text(
                selectedStation.uvLevelDesc,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(width: 24),
              Icon(
                Icons.opacity_rounded,
                size: 16,
                color: Theme.of(context).textTheme.subtitle1!.color,
              ),
              SizedBox(width: 4),
              Text(
                "${selectedStation.humidity.value}%",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              generalInfo,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          )
        ],
      ),
    );
  }
}

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          for (final forecast in forecasts)
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      forecast.day,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Image.network(
                    forecast.status.getIconLink(),
                    width: 40,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          forecast.maxTemp.value.toString(),
                          style: Theme.of(context).textTheme.headline6?.copyWith(
                                color: Theme.of(context).hotColor,
                              ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          forecast.maxTemp.value.toString(),
                          style: Theme.of(context).textTheme.headline6?.copyWith(
                                color: Theme.of(context).coldColor,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

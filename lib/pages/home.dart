import 'package:flutter/material.dart';
import 'package:hko_weather/hko_weather.dart';
import 'package:weather/themes.dart';
import 'package:weather/widgets/forecast_list.dart';
import 'package:weather/widgets/location_app_bar.dart';
import 'package:weather/widgets/weather_overview.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Theme.of(context).backgroundDecoration,
      child: Scaffold(
        body: ListView(
          children: [
            LocationAppBar(
              stationName: CurrentWeatherResponse.mock().stations.first.name,
            ),
            SizedBox(height: 20), // Spacing
            WeatherOverview(
              selectedStation: CurrentWeatherResponse.mock().stations.first,
              generalInfo: ForecastResponse.mock().situation,
            ),
            SizedBox(height: 40), // Spacing
            ForecastList(
              forecasts: ForecastResponse.mock().forecasts,
            ),
          ],
        ),
      ),
    );
  }
}

/// ^^^^^^ Stateless Widget ^^^^^^
/// -------------------------------
/// -    TUTORIAL PURPOSE ONLY    -
/// -------------------------------
/// vvvvvv Stateful Widget vvvvvvv

/// Widget class
class DemoStatefulWidget extends StatefulWidget {
  const DemoStatefulWidget({Key? key}) : super(key: key);

  @override
  _DemoStatefulWidgetState createState() => _DemoStatefulWidgetState();
}

/// State class of the widget
///
/// Separated from the widget class for mutability
/// since Widget is immutable and constructed everytime the Widget tree rebuilt
class _DemoStatefulWidgetState extends State<DemoStatefulWidget> {
  int counter =
      0; // Internal state! Belongs to this widget `DemoStatefulWidget` only!

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(counter.toString()),
          TextButton(
            onPressed: incrementCounter,
            child: const Text("Press Me!"),
          ),
        ],
      ),
    );
  }

  ///
  void incrementCounter() {
    setState(() {
      counter += 1;
    });
  }
}

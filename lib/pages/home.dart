import 'package:flutter/material.dart';
import 'package:hko_weather/hko_weather.dart';
import 'package:weather/themes.dart';
import 'package:weather/widgets/forecast_list.dart';
import 'package:weather/widgets/location_app_bar.dart';
import 'package:weather/widgets/weather_overview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Widget Key
  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  // Current Weather
  CurrentWeatherResponse? currentWeather;
  WeatherStation? selectedStation; // What we need

  // Forecast
  ForecastResponse? forecast; // What we need

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.scheduleFrameCallback((_) {
      refreshIndicatorKey.currentState?.show();
    });
  }

  /// Fetch Everything
  Future<List<void>> fetchWeatherInfo() async {
    return Future.wait([
      fetchCurrentWeather(),
      fetchForecast(),
    ]);
  }

  Future<void> fetchCurrentWeather() async {
    final _currentWeather = await getCurrentWeather();
    setState(() {
      currentWeather = _currentWeather;
      // Set the selected station base on previously selected station name
      // If previously nothing is selected, then select the first one
      selectedStation = selectedStation != null ?
        _currentWeather.stations.firstWhere((station) => station.name == selectedStation!.name) :
        _currentWeather.stations.first;
    });
  }

  Future<void> fetchForecast() async {
    final _forecast = await getWeatherForecast();
    setState(() {
      forecast = _forecast;
    });
  }

  void _showStationsPicker() {
    showModalBottomSheet(
      context: context,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.4,
          minChildSize: 0.2,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, sc) {
            return ListView(
              controller: sc,
              children: [
                Container(
                  alignment: Alignment.center,
                  color: Theme.of(context).primaryColor,
                  height: 40,
                  child: Text(
                    "Stations",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                for (final station
                    in currentWeather?.stations ?? <WeatherStation>[])
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      setState(() {
                        selectedStation = station;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(color: Theme.of(context).dividerColor),
                        ),
                      ),
                      alignment: Alignment.center,
                      height: 40,
                      child: Text(
                        station.name,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Theme.of(context).backgroundDecoration,
      child: Scaffold(
        body: RefreshIndicator(
          key: refreshIndicatorKey,
          onRefresh: fetchWeatherInfo,
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    final _selectedStation = selectedStation;
    final _forecast = forecast;

    // No data :(
    if (_selectedStation == null || _forecast == null) {
      return Container();
    }

    // We got data!
    return ListView(
      children: [
        GestureDetector(
          onTap: _showStationsPicker,
          child: LocationAppBar(
            stationName: _selectedStation.name,
          ),
        ),
        SizedBox(height: 20), // Spacing
        WeatherOverview(
          selectedStation: _selectedStation,
          generalInfo: _forecast.situation,
        ),
        SizedBox(height: 40), // Spacing
        ForecastList(
          forecasts: _forecast.forecasts,
        ),
      ],
    );
  }
}

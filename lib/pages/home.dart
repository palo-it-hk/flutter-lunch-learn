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
      selectedStation = _currentWeather.stations.first;
    });
  }

  Future<void> fetchForecast() async {
    final _forecast = await getWeatherForecast();
    setState(() {
      forecast = _forecast;
    });
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
        LocationAppBar(
          stationName: _selectedStation.name,
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

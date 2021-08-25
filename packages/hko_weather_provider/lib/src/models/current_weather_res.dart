import 'package:hko_weather/hko_weather.dart';
import 'package:hko_weather/src/models/forecast_value.dart';

/// Represent the current weather response from hko
/// We use custom parsing here instead of json_serializable
/// since the original response is messy and not ideal to manipulate in UI
class CurrentWeatherResponse {
  final List<WeatherStation> stations;

  CurrentWeatherResponse(this.stations);

  factory CurrentWeatherResponse.fromJson(Map<String, dynamic> json) {
    // Common information across stations
    final _humidity = ForecastValue.fromJson(json["humidity"]["data"][0]);
    final _uvData = json["uvindex"];
    double _uvIndex = 0;
    String _uvLevelDesc = "Unknown";
    if (_uvData != null && _uvData is Map<String, dynamic>) {
      _uvIndex = _uvData["data"][0]["value"] as double;
      _uvLevelDesc =
          (_uvData["data"][0]["desc"] as String).toUpperCase();
    }
    final _weatherStatus = WeatherStatusExtension.fromValue(
        (json["icon"] as List<dynamic>).first as int);

    // Parse stations
    final _stations = (json["temperature"]["data"] as List<dynamic>)
        .map((e) => WeatherStation(
              name: e["place"] as String,
              temperature: ForecastValue.fromJson(e),
              humidity: _humidity,
              uvIndex: _uvIndex,
              uvLevelDesc: _uvLevelDesc,
              weatherStatus: _weatherStatus,
            ))
        .toList();
    return CurrentWeatherResponse(_stations);
  }

  /// Dummy data to facilitate UI building
  factory CurrentWeatherResponse.mock() {
    return CurrentWeatherResponse(
      List.generate(
        10,
        (i) => WeatherStation(
          name: "Station $i",
          temperature: ForecastValue(30, "C"),
          humidity: ForecastValue(100, "%"),
          uvIndex: 3,
          uvLevelDesc: "Low",
          weatherStatus: WeatherStatus.Sunny,
        ),
      ),
    );
  }
}

class WeatherStation {
  final String name;
  final ForecastValue temperature;
  final ForecastValue humidity;
  final double uvIndex;
  final String uvLevelDesc;
  final WeatherStatus weatherStatus;

  WeatherStation({
    required this.name,
    required this.temperature,
    required this.humidity,
    required this.uvIndex,
    required this.uvLevelDesc,
    required this.weatherStatus,
  });
}

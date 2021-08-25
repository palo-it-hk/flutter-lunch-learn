import 'dart:convert';

import 'package:hko_weather/hko_weather.dart';
import 'package:http/http.dart' as http;

const CURRENT_WEATHER_ENDPOINT = "https://data.weather.gov.hk/weatherAPI/opendata/weather.php?dataType=rhrread&lang=en";
const WEATHER_FORECAST_ENDPOINT = "https://data.weather.gov.hk/weatherAPI/opendata/weather.php?dataType=fnd&lang=en";

Future<CurrentWeatherResponse> getCurrentWeather() async {
  final response = await http.get(Uri.parse(CURRENT_WEATHER_ENDPOINT));
  return CurrentWeatherResponse.fromJson(jsonDecode(response.body));
}

Future<ForecastResponse> getWeatherForecast() async {
  final response = await http.get(Uri.parse(WEATHER_FORECAST_ENDPOINT));
  return ForecastResponse.fromJson(jsonDecode(response.body));
}

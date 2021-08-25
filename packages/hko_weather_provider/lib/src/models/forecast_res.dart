import 'forecast_value.dart';
import 'rain_probability.dart';
import 'weather_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forecast_res.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class ForecastResponse {
  @JsonKey(name: "generalSituation")
  final String situation;
  @JsonKey(name: "weatherForecast")
  final List<Forecast> forecasts;

  ForecastResponse(this.situation, this.forecasts);

  factory ForecastResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseFromJson(json);

  /// Dummy data to facilitate UI building
  factory ForecastResponse.mock() {
    return ForecastResponse(
      "Sunny periods with a few showers and isolated thunderstorms.",
      List.generate(
        20,
        (_) => Forecast(
          DateTime.now(),
          "Sunday",
          "Light winds force 2.",
          "Very hot with sunny periods. One or two isolated showers.",
          ForecastValue(31, "C"),
          ForecastValue(28, "C"),
          ForecastValue(90, "percent"),
          ForecastValue(60, "percent"),
          WeatherStatus.Cloudy,
          RainProbability.Medium,
        ),
      ),
    );
  }
}

@JsonSerializable(explicitToJson: true, createToJson: false)
class Forecast {
  static DateTime toDate(String s) => DateTime(int.parse(s.substring(0, 4)), int.parse(s.substring(4, 6)), int.parse(s.substring(6)));

  @JsonKey(name: "forecastDate", fromJson: Forecast.toDate)
  final DateTime date;
  @JsonKey(name: "week")
  final String day;
  @JsonKey(name: "forecastWind")
  final String windText;
  @JsonKey(name: "forecastWeather")
  final String weatherText;
  @JsonKey(name: "forecastMaxtemp")
  final ForecastValue maxTemp;
  @JsonKey(name: "forecastMintemp")
  final ForecastValue minTemp;
  @JsonKey(name: "forecastMaxrh")
  final ForecastValue maxHumidity;
  @JsonKey(name: "forecastMinrh")
  final ForecastValue minHumidity;
  @JsonKey(name: "ForecastIcon", fromJson: WeatherStatusExtension.fromValue)
  final WeatherStatus status;
  @JsonKey(name: "PSR", fromJson: RainProbabilityExtension.fromValue)
  final RainProbability rainProbability;

  Forecast(
      this.date,
      this.day,
      this.windText,
      this.weatherText,
      this.maxTemp,
      this.minTemp,
      this.maxHumidity,
      this.minHumidity,
      this.status,
      this.rainProbability);

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
}
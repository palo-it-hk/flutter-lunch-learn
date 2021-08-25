// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastResponse _$ForecastResponseFromJson(Map<String, dynamic> json) {
  return ForecastResponse(
    json['generalSituation'] as String,
    (json['weatherForecast'] as List<dynamic>)
        .map((e) => Forecast.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Forecast _$ForecastFromJson(Map<String, dynamic> json) {
  return Forecast(
    Forecast.toDate(json['forecastDate'] as String),
    json['week'] as String,
    json['forecastWind'] as String,
    json['forecastWeather'] as String,
    ForecastValue.fromJson(json['forecastMaxtemp'] as Map<String, dynamic>),
    ForecastValue.fromJson(json['forecastMintemp'] as Map<String, dynamic>),
    ForecastValue.fromJson(json['forecastMaxrh'] as Map<String, dynamic>),
    ForecastValue.fromJson(json['forecastMinrh'] as Map<String, dynamic>),
    WeatherStatusExtension.fromValue(json['ForecastIcon'] as int),
    RainProbabilityExtension.fromValue(json['PSR'] as String),
  );
}

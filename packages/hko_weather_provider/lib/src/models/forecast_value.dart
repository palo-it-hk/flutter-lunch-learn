import 'package:json_annotation/json_annotation.dart';

part 'forecast_value.g.dart';

@JsonSerializable(createToJson: false)
class ForecastValue {
  final int value;
  @JsonKey(fromJson: ForecastValue.convertUnit)
  final String unit;

  ForecastValue(this.value, this.unit);

  factory ForecastValue.fromJson(Map<String, dynamic> json) =>
      _$ForecastValueFromJson(json);

  static String convertUnit(s) {
    if (s == "percent") return "%";
    return s;
  }
}
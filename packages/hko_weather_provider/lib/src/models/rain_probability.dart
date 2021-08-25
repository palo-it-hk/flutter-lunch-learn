enum RainProbability {
  High,
  MediumHigh,
  Medium,
  MediumLow,
  Low,
  Unknown,
}

extension RainProbabilityExtension on RainProbability {
  static const _RAIN_PROBABILITY_MAP = {
    "High": RainProbability.High,
    "Medium High": RainProbability.MediumHigh,
    "Medium": RainProbability.Medium,
    "Medium Low": RainProbability.MediumLow,
    "Low": RainProbability.Low,
  };

  static RainProbability fromValue(String value) =>
      _RAIN_PROBABILITY_MAP[value] ?? RainProbability.Unknown;

  String toValue() => _RAIN_PROBABILITY_MAP.keys.firstWhere(
        (k) => _RAIN_PROBABILITY_MAP[k] == this,
    orElse: () => "Unknown",
  );
}

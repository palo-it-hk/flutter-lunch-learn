enum WeatherStatus {
  Sunny, // 50
  SunnyPeriods,
  SunnyIntervals,
  SunnyPeriodsWithFewShowers,
  SunnyIntervalsWithShowers,
  Cloudy, // 60
  Overcast,
  LightRain,
  Rain,
  HeavyRain,
  Thunderstorms,
  NightFine1stLunar, // 70
  NightFine2ndTo6thLunar,
  NightFine7thTo13thLunar,
  NightFine14thTo17thLunar,
  NightFine18thTo24thLunar,
  NightFine25thTo30thLunar,
  NightMainlyCloudy,
  NightMainlyFine,
  Windy, // 80
  Dry,
  Humid,
  Fog,
  Mist,
  Haze,
  Hot, // 90
  Warm,
  Cool,
  Cold,
  Unknown,
}

extension WeatherStatusExtension on WeatherStatus {
  static const _WEATHER_STATUS_MAP = {
    50: WeatherStatus.Sunny,
    51: WeatherStatus.SunnyPeriods,
    52: WeatherStatus.SunnyIntervals,
    53: WeatherStatus.SunnyPeriodsWithFewShowers,
    54: WeatherStatus.SunnyIntervalsWithShowers,
    60: WeatherStatus.Cloudy,
    61: WeatherStatus.Overcast,
    62: WeatherStatus.LightRain,
    63: WeatherStatus.Rain,
    64: WeatherStatus.HeavyRain,
    65: WeatherStatus.Thunderstorms,
    70: WeatherStatus.NightFine1stLunar,
    71: WeatherStatus.NightFine2ndTo6thLunar,
    72: WeatherStatus.NightFine7thTo13thLunar,
    73: WeatherStatus.NightFine14thTo17thLunar,
    74: WeatherStatus.NightFine18thTo24thLunar,
    75: WeatherStatus.NightFine25thTo30thLunar,
    76: WeatherStatus.NightMainlyCloudy,
    77: WeatherStatus.NightMainlyFine,
    80: WeatherStatus.Windy,
    81: WeatherStatus.Dry,
    82: WeatherStatus.Humid,
    83: WeatherStatus.Fog,
    84: WeatherStatus.Mist,
    85: WeatherStatus.Haze,
    90: WeatherStatus.Hot,
    91: WeatherStatus.Warm,
    92: WeatherStatus.Cool,
    93: WeatherStatus.Cold,
  };

  static WeatherStatus fromValue(int value) =>
      _WEATHER_STATUS_MAP[value] ?? WeatherStatus.Unknown;

  int toValue() => _WEATHER_STATUS_MAP.keys.firstWhere(
        (k) => _WEATHER_STATUS_MAP[k] == this,
        orElse: () => -1,
      );

  String getIconLink() {
    if (this == WeatherStatus.Unknown) return "";
    return "https://www.hko.gov.hk/images/HKOWxIconOutline/pic${this.toValue()}.png";
  }
}

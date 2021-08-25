import 'package:flutter/material.dart';
import 'package:weather/pages/home.dart';
import 'package:weather/themes.dart';

/// App Entry Point
void main() {
  runApp(App());
}

/// App Widget. This is the root of the application
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Or Cupertino
      title: 'Weather',
      theme: appThemeLight,
      darkTheme: appThemeDark,
      home: HomePage(),
    );
  }
}

import 'package:flutter/material.dart';

/// Color Constants
/// Light
const PrimaryLight = Color(0xFFBDCCFF);
const HighEmphasisLight = Color(0xFF303030);
const MediumEmphasisLight = Color(0xFF505050);
const OutlineLight = Color(0x1D000000);
const BackgroundDecorationGradientStartLight = PrimaryLight;
const BackgroundDecorationGradientEndLight = Color(0xFF54BADA);
const HotLight = Color(0xFFBD4D4D);
const ColdLight = Color(0xFF247182);

/// Dark
const PrimaryDark = Color(0xFF333333);
const HighEmphasisDark = Color(0xFFFFFFFF);
const MediumEmphasisDark = Color(0xFFDDDDDD);
const OutlineDark = Color(0x80FFFFFF);
const BackgroundDecorationColorDark = PrimaryDark;
const HotDark = Color(0xFFDA6A6A);
const ColdDark = Color(0xFF24A9C6);

/// App Themes
final baseTheme = ThemeData(
  fontFamily: 'Varela', // Our custom font, defined in pubspec.yaml
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
  ),
  scaffoldBackgroundColor: Colors.transparent,
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 80),
  ),
);

final appThemeLight = baseTheme.copyWith(
  brightness: Brightness.light,
  dividerColor: OutlineLight,
  primaryColor: PrimaryLight,
  bottomSheetTheme: BottomSheetThemeData(
    modalBackgroundColor: Colors.white,
  ),
  textTheme: baseTheme.textTheme.apply(
    displayColor: HighEmphasisLight,
    bodyColor: MediumEmphasisLight,
  ),
);

final appThemeDark = baseTheme.copyWith(
  brightness: Brightness.dark,
  dividerColor: OutlineDark,
  primaryColor: PrimaryDark,
  bottomSheetTheme: BottomSheetThemeData(
    modalBackgroundColor: PrimaryDark,
  ),
  textTheme: baseTheme.textTheme.apply(
    displayColor: HighEmphasisDark,
    bodyColor: MediumEmphasisDark,
  ),
);

/// Custom Theme Data Fields
extension AppThemeData on ThemeData {
  Color get hotColor => brightness == Brightness.light ? HotLight : HotDark;

  Color get coldColor => brightness == Brightness.light ? ColdLight : ColdDark;

  Decoration get backgroundDecoration => brightness == Brightness.light
      ? appBackgroundDecoration
      : appBackgroundDecorationDark;
}

/// App Background Decoration
const appBackgroundDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      BackgroundDecorationGradientStartLight,
      BackgroundDecorationGradientEndLight,
    ],
    begin: const FractionalOffset(0.0, 0.0),
    end: const FractionalOffset(1.0, 1.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  ),
);

const appBackgroundDecorationDark = BoxDecoration(
  color: BackgroundDecorationColorDark,
);

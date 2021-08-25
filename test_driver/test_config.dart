import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'steps/steps.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [RegExp('test_driver/features/*.*.feature')]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json')
    ]
    ..stepDefinitions = [
      CheckWidgetIsPresent(),
      TapWidget(),
      WaitForValueSeconds(),
    ]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app_test.dart";
  return GherkinRunner().execute(config);
}

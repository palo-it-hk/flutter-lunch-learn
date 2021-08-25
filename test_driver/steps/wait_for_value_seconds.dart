import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class WaitForValueSeconds extends And1WithWorld<int, FlutterWorld> {
  @override
  Future<void> executeStep(int secondsToWait) async {
    await Future.delayed(Duration(seconds: secondsToWait), (){});
  }
  @override
  RegExp get pattern => RegExp(r"I wait for {int} seconds");
}

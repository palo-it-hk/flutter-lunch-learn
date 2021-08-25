import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class TapWidget extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String elementKey) async {
    final elementFinder = find.byValueKey(elementKey);
    await FlutterDriverUtils.tap(world.driver, elementFinder);
  }
  @override
  RegExp get pattern => RegExp(r"I tap {string}");
}

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class CheckWidgetIsPresent extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String elementKey) async {
    final elementfinder = find.byValueKey(elementKey);
    bool isPresent = await FlutterDriverUtils.isPresent(world.driver, elementfinder);
    expect(isPresent, true);
  }
  @override
  RegExp get pattern => RegExp("check {string} is present");
}
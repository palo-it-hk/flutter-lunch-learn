import 'package:flutter/material.dart';
import 'package:weather/themes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Theme.of(context).backgroundDecoration,
      child: Scaffold(
        body: DemoStatefulWidget(),
        // TODO: Scroll View
        // // TODO: Column
        // // // TODO: App Bar
        // // // TODO: Overview
        // // // TODO: Forecast List
      ),
    );
  }
}

/// ^^^^^^ Stateless Widget ^^^^^^
/// -------------------------------
/// -    TUTORIAL PURPOSE ONLY    -
/// -------------------------------
/// vvvvvv Stateful Widget vvvvvvv

/// Widget class
class DemoStatefulWidget extends StatefulWidget {
  const DemoStatefulWidget({Key? key}) : super(key: key);

  @override
  _DemoStatefulWidgetState createState() => _DemoStatefulWidgetState();
}

/// State class of the widget
///
/// Separated from the widget class for mutability
/// since Widget is immutable and constructed everytime the Widget tree rebuilt
class _DemoStatefulWidgetState extends State<DemoStatefulWidget> {
  int counter = 0; // Internal state! Belongs to this widget `DemoStatefulWidget` only!

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(counter.toString()),
          TextButton(
            onPressed: incrementCounter,
            child: const Text("Press Me!"),
          ),
        ],
      ),
    );
  }

  ///
  void incrementCounter() {
    setState(() {
      counter += 1;
    });
  }
}


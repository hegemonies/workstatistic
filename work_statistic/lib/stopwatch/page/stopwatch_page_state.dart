import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workstatistic/stopwatch/page/stopwatch_page.dart';
import 'package:workstatistic/stopwatch/stopwatch_text/stopwatch_text.dart';

import '../models/dependencies.dart';

class StopwatchPageState extends State<StopwatchPage> {
  final Dependencies dependencies = new Dependencies();

  void leftButtonPressed() {
    setState(() {
      if (dependencies.stopwatch.isRunning) {
        print("${dependencies.stopwatch.elapsedMilliseconds}");
      } else {
        dependencies.stopwatch.reset();
      }
    });
  }

  void rightButtonPressed() {
    setState(() {
      if (dependencies.stopwatch.isRunning) {
        dependencies.stopwatch.stop();
      } else {
        dependencies.stopwatch.start();
      }
    });
  }

  Widget buildFloatingButton(String text, VoidCallback callback) {
    TextStyle roundTextStyle =
        const TextStyle(fontSize: 16.0, color: Colors.white);
    return new FloatingActionButton(
        child: Text(text, style: roundTextStyle), onPressed: callback);
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: StopwatchText(dependencies: dependencies),
        ),
        Expanded(
            flex: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildFloatingButton(
                    dependencies.stopwatch.isRunning ? "lap" : "reset",
                    leftButtonPressed),
                buildFloatingButton(
                    dependencies.stopwatch.isRunning ? "stop" : "start",
                    rightButtonPressed),
              ],
            )),
      ],
    );
  }
}

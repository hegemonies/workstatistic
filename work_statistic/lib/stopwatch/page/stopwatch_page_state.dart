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

  String getGreetingTextWithDate() {
    final currentDateTime = DateTime.now();

    var weekDay = "";

    switch(currentDateTime.weekday) {
      case 1:
        weekDay = "monday";
      break;

      case 2:
        weekDay = "tuesday";
      break;

      case 3:
        weekDay = "wednesday";
        break;

      case 4:
        weekDay = "thursday";
        break;

      case 5:
        weekDay = "friday";
        break;

      case 6:
        weekDay = "saturday";
        break;

      case 7:
        weekDay = "sunday";
        break;
    }

    final greeting = "Hi, today $weekDay";
    final currentDateInFormat = "${currentDateTime.day}-${currentDateTime.month}-${currentDateTime.year}";
    return "$greeting\n$currentDateInFormat";
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Text(
              getGreetingTextWithDate(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 48,
              color: Colors.black45
            ),
          ),
        ),
        Expanded(
          child: StopwatchText(dependencies: dependencies),
        ),
        Expanded(
//            flex: 0,
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

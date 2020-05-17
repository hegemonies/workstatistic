import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workstatistic/stopwatch/page/stopwatch_page.dart';
import 'package:workstatistic/stopwatch/stopwatch_text/stopwatch_text.dart';

import '../models/dependencies.dart';

class StopwatchPageState extends State<StopwatchPage> {

  void leftButtonPressed() {
    setState(() {
      if (widget.dependencies.stopwatch.isRunning) {
        print("${widget.dependencies.stopwatch.elapsedMilliseconds}");
      } else {
        widget.dependencies.stopwatch.reset();
      }
    });
  }

  void rightButtonPressed() {
    setState(() {
      if (widget.dependencies.stopwatch.isRunning) {
        widget.dependencies.stopwatch.stop();
      } else {
        widget.dependencies.stopwatch.start();
      }
    });
  }

  Widget buildButton(String text, VoidCallback callback) {
    TextStyle roundTextStyle =
        const TextStyle(fontSize: 24.0, color: Colors.white);
    return FlatButton(
      child: Text(text, style: roundTextStyle),
      shape: ContinuousRectangleBorder(),
      color: Colors.blueGrey,
      onPressed: callback
    );
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

    final greeting = "Hi, today is $weekDay";
    final currentDateInFormat = "${currentDateTime.day}-${currentDateTime.month}-${currentDateTime.year}";
    return "$greeting\n$currentDateInFormat";
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          getGreetingTextWithDate(),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 46,
              color: Colors.black45
          ),
        ),
        StopwatchText(dependencies: widget.dependencies),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildButton(
                widget.dependencies.stopwatch.isRunning ? "lap" : "reset",
                leftButtonPressed),
            buildButton(
                widget.dependencies.stopwatch.isRunning ? "stop" : "start",
                rightButtonPressed),
          ],
        ),
      ],
    );
  }
}

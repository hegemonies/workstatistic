import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workstatistic/stopwatch/page/stopwatch_page.dart';
import 'package:workstatistic/stopwatch/stopwatch_text/stopwatch_text.dart';

class StopwatchPageState extends State<StopwatchPage> {
  void leftButtonPressed() {
    setState(() {
      widget.dependencies.stopwatch.reset();
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
    return OutlineButton(
      highlightElevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(text),
//      color: Theme.of(context).primaryColor,
      textColor: Theme.of(context).primaryColor,
      onPressed: callback,
    );
  }

  String getWeekDay(DateTime dateTime) {
    var weekDay = "";

    switch (dateTime.weekday) {
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

    return "$weekDay ";
  }

  String getGreetings() {
    return "Hi, today is ";
  }

  String getDateInFormat(DateTime dateTime) {
    return "${dateTime.day}-${dateTime.month}-${dateTime.year}";
  }

  @override
  Widget build(BuildContext context) {
    final currentDateTime = DateTime.now();
    String greetings = getGreetings();
    String weekDay = getWeekDay(currentDateTime);
    final dateInFormat = getDateInFormat(currentDateTime);

    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 12),
          child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 36,
                    color: Colors.black45),
                children: [
                  TextSpan(text: greetings),
                  TextSpan(
                      text: weekDay,
                      style: TextStyle(color: Theme.of(context).accentColor)),
                  TextSpan(text: dateInFormat)
                ]),
          ),
        ),
        StopwatchText(dependencies: widget.dependencies),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildButton("Reset", leftButtonPressed),
            buildButton(
                widget.dependencies.stopwatch.isRunning ? "Stop" : "Start",
                rightButtonPressed),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workstatistic/stopwatch/models/elapsed_time.dart';

import 'hours_minute_seconds.dart';

class HoursMinutesSecondsState extends State<HoursMinutesSeconds> {
  get textStyle =>
      TextStyle(fontSize: 96.0, color: Theme.of(context).primaryColor);

  int hours = 0;
  int minutes = 0;
  int seconds = 0;

  String hoursString = "00";
  String minutesString = "00";
  String secondsString = "00";

  Widget get hoursText =>
      Text(hoursString, style: textStyle, key: ValueKey<int>(hours));

  Widget get minutesText =>
      Text(minutesString, style: textStyle, key: ValueKey<int>(minutes));

  Widget get secondsText =>
      Text(secondsString, style: textStyle, key: ValueKey<int>(seconds));

  Widget stopwatchText;

  @override
  void initState() {
    hours = widget.dependencies.stopwatch.elapsed.inHours;
    minutes = widget.dependencies.stopwatch.elapsed.inMinutes;
    seconds = widget.dependencies.stopwatch.elapsed.inSeconds;
    widget.dependencies.timerListeners.add(onTick);
    stopwatchText = getStopwatchText();
    super.initState();
  }

  void onTick(ElapsedTime elapsed) {
    if (elapsed.hours != hours ||
        elapsed.minutes != minutes ||
        elapsed.seconds != seconds) {
      setState(() {
        hours = elapsed.hours;
        minutes = elapsed.minutes;
        seconds = elapsed.seconds;
//        stopwatchText = getStopwatchText();
      });
    }
  }

  @override
  void dispose() {
    widget.dependencies.timerListeners.remove(onTick);
    super.dispose();
  }

  setStopwatchText() {
    hoursString = (hours % 60).toString().padLeft(2, '0');
    minutesString = (minutes % 60).toString().padLeft(2, '0');
    secondsString = (seconds % 60).toString().padLeft(2, '0');
  }

  Widget getStopwatchText() {
    setStopwatchText();
    return Text(
      '$hoursString:$minutesString:$secondsString',
      style: widget.dependencies.textStyle,
      key: ValueKey(seconds),
    );
  }

  @override
  Widget build(BuildContext context) {
    setStopwatchText();
    final animationDuration = 300;

    return Container(
        height: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              child: hoursText,
              duration: Duration(milliseconds: animationDuration),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(child: child, scale: animation);
              },
            ),
            Text(":", style: textStyle),
            AnimatedSwitcher(
              child: minutesText,
              duration: Duration(milliseconds: animationDuration),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(child: child, scale: animation);
              },
            ),
            Text(":", style: textStyle),
            AnimatedSwitcher(
              child: secondsText,
              duration: Duration(milliseconds: animationDuration),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(child: child, scale: animation);
              },
            )
          ],
        ));
  }
}

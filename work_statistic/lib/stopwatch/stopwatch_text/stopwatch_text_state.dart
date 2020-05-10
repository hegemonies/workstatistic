import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:workstatistic/stopwatch/models/elapsed_time.dart';
import 'package:workstatistic/stopwatch/stopwatch_text/stopwatch_text.dart';

import '../models/dependencies.dart';
import 'time/hours_minute_seconds.dart';

class StopwatchTextState extends State<StopwatchText> {
  StopwatchTextState({this.dependencies});

  final Dependencies dependencies;
  Timer timer;
  int milliseconds;

  @override
  void initState() {
    timer = Timer.periodic(
        Duration(milliseconds: dependencies.timerMillisecondsRefreshRate),
        callback);
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  void callback(Timer timer) {
    if (milliseconds != dependencies.stopwatch.elapsedMilliseconds) {
      milliseconds = dependencies.stopwatch.elapsedMilliseconds;
      final int seconds = (milliseconds / 1000).truncate();
      final int minutes = (seconds / 60).truncate();
      final int hours = (minutes / 60).truncate();
      final ElapsedTime elapsedTime = new ElapsedTime(
        hours: hours,
        seconds: seconds,
        minutes: minutes,
      );
      for (final listener in dependencies.timerListeners) {
        listener(elapsedTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RepaintBoundary(
          child: new SizedBox(
            height: 100.0,
            child: new HoursMinutesSeconds(dependencies: dependencies),
          ),
        ),
      ),
    );
  }
}

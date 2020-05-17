import 'package:flutter/widgets.dart';
import 'package:workstatistic/stopwatch/models/elapsed_time.dart';

import 'hours_minute_seconds.dart';

class HoursMinutesSecondsState extends State<HoursMinutesSeconds> {
  int hours = 0;
  int minutes = 0;
  int seconds = 0;

  @override
  void initState() {
    hours = widget.dependencies.stopwatch.elapsed.inHours;
    minutes = widget.dependencies.stopwatch.elapsed.inMinutes;
    seconds = widget.dependencies.stopwatch.elapsed.inSeconds;
    widget.dependencies.timerListeners.add(onTick);
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
      });
    }
  }

  @override
  void dispose() {
    widget.dependencies.timerListeners.remove(onTick);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String hoursString = (hours % 60).toString().padLeft(2, '0');
    String minutesString = (minutes % 60).toString().padLeft(2, '0');
    String secondsString = (seconds % 60).toString().padLeft(2, '0');
    return new Text('$hoursString:$minutesString:$secondsString',
        style: widget.dependencies.textStyle);
  }
}

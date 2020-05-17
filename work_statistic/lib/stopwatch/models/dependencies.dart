import 'package:flutter/cupertino.dart';

import 'elapsed_time.dart';

//class Dependencies extends InheritedWidget {
class Dependencies {
  final List<ValueChanged<ElapsedTime>> timerListeners =
      <ValueChanged<ElapsedTime>>[];
  final textStyle = const TextStyle(fontSize: 90.0, fontFamily: "Roboto");
  final Stopwatch stopwatch = new Stopwatch();
  final int timerMillisecondsRefreshRate = 30;

//  Dependencies({Widget child}) : super(child: child);
//
//  @override
//  bool updateShouldNotify(Dependencies oldWidget) => true;
//
//  static Dependencies of(BuildContext context) =>
//      context.inheritFromWidgetOfExactType(Dependencies);
}

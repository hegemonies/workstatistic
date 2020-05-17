import 'package:flutter/material.dart';
import 'package:workstatistic/stopwatch/models/dependencies.dart';
import 'package:workstatistic/stopwatch/page/stopwatch_page.dart';

//class TodayRoute extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return TodayRouteState();
//  }
//}
//
//class TodayRouteState extends State<TodayRoute> {
//
//  final stopwatch = Stopwatch();
//
//  void foo() {
//    stopwatch.start()
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//  }
//}

class TodayRoute extends StatelessWidget {

  final Dependencies dependencies = Dependencies();

  StatefulWidget getRoute() {
    return StopwatchPage(dependencies);
  }

  @override
  Widget build(BuildContext context) {
    return StopwatchPage(dependencies);
  }
}

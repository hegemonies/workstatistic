import 'dart:async';

import 'package:flutter/material.dart';
import 'file:///E:/git/workstatistic/work_statistic/lib/stopwatch/models/dependencies.dart';
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

class TodayRoute {
  StatefulWidget getRoute() {
    return StopwatchPage();
  }
}

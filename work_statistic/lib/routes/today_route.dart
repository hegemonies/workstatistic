import 'package:flutter/material.dart';
import 'package:workstatistic/stopwatch/models/dependencies.dart';
import 'package:workstatistic/stopwatch/page/stopwatch_page.dart';


class TodayRoute extends StatelessWidget {
  final Dependencies dependencies = Dependencies();

  @override
  Widget build(BuildContext context) {
    return StopwatchPage(dependencies);
  }
}

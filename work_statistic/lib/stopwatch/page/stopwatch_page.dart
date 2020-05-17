import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workstatistic/stopwatch/models/dependencies.dart';

import 'stopwatch_page_state.dart';

class StopwatchPage extends StatefulWidget {
//  StopwatchPage({Key key, Dependencies dependencies}) : super(key: key) {

//    this.dependencies = dependencies;
//  }

  StopwatchPage(this.dependencies);

  final Dependencies dependencies;

  StopwatchPageState createState() => StopwatchPageState();
}

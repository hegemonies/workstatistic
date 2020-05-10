import 'package:flutter/cupertino.dart';

import '../models/dependencies.dart';
import 'stopwatch_text_state.dart';

class StopwatchText extends StatefulWidget {
  StopwatchText({this.dependencies});

  final Dependencies dependencies;

  StopwatchTextState createState() =>
      StopwatchTextState(dependencies: dependencies);
}

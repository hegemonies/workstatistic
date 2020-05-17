import 'package:flutter/widgets.dart';

import '../../models/dependencies.dart';
import 'hours_minute_seconds_state.dart';

class HoursMinutesSeconds extends StatefulWidget {
  HoursMinutesSeconds({this.dependencies});

  final Dependencies dependencies;

  HoursMinutesSecondsState createState() =>
      new HoursMinutesSecondsState();
}

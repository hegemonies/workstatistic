import 'package:flutter/material.dart';

class AnalyticsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Analytics route"),
        ),
        body: Scaffold(
          bottomNavigationBar: BottomAppBar(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: navigationBar(context)),
          )),
        ));
  }
}

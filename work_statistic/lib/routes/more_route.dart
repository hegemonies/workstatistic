import 'package:flutter/material.dart';

class MoreRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("More route"),
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

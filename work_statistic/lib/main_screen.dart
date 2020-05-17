import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workstatistic/routes/today_route.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Bravo Work Statistic",
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          canvasColor: Colors.white,
        ),
        home: MainScreenNavigation());
  }
}

class MainScreenNavigation extends StatefulWidget {

  var todayPage = TodayRoute();

  @override
  State<StatefulWidget> createState() {
    return MainScreenNavigationState();
  }
}

class MainScreenNavigationState extends State<MainScreenNavigation> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (int) {
          print('Page Changes to index $int');
        },
        children: <Widget>[
          Center(
            child: Container(
                height: 500.0,
                child: widget.todayPage
            ),
          ),
          Center(
            child: Container(
              child: Text("Analytics page"),
            ),
          ),
          Center(
            child: Container(
              child: Text("More page"),
            ),
          ),
        ],
        physics: PageScrollPhysics(),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
//              width: 135,
              child: FlatButton(
                padding: EdgeInsets.all(17.0),
                onPressed: () {
                  setState(() {
                    pageController.jumpToPage(0);
                  });
                },
                child: Column(
                  children: <Widget>[Icon(Icons.today), Text("Today")],
                ),
              ),
            ),
            Container(
//              width: 135,
              child: FlatButton(
                padding: EdgeInsets.all(17.0),
                onPressed: () {
                  setState(() {
                    pageController.jumpToPage(1);
                  });
                },
                child: Column(
                  children: <Widget>[Icon(Icons.show_chart), Text("Analytics")],
                ),
              ),
            ),
            Container(
//              width: 135,
              child: FlatButton(
                padding: EdgeInsets.all(17.0),
                onPressed: () {
                  setState(() {
                    pageController.jumpToPage(2);
                  });
                },
                child: Column(
                  children: <Widget>[Icon(Icons.more_horiz), Text("More")],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

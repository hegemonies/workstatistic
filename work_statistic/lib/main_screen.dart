import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workstatistic/routes/today_route.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Bravo Work Statistic",
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
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
  final countOfPage = 3;
  double bottomAppBarHeight(BuildContext context) =>
      MediaQuery.of(context).size.height / 10;
  double pageHeight(BuildContext context) =>
      MediaQuery.of(context).size.height * 9 / 10;
  double bottomAppBarButtonWidth(BuildContext context) =>
      MediaQuery.of(context).size.width / countOfPage;

  pageView() => PageView(
        controller: pageController,
        children: <Widget>[
          Center(
            child: Container(
                height: pageHeight(context),
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
      );

  createBottomAppBarButton(int pageNumber, IconData icon, String text) =>
      Container(
        width: bottomAppBarButtonWidth(context),
        child: FlatButton(
          splashColor: Theme.of(context).splashColor,
          textColor:  Theme.of(context).primaryColor,
          padding: EdgeInsets.all(17.0),
          onPressed: () {
            setState(() {
              pageController.jumpToPage(pageNumber);
            });
          },
          child: Column(
            children: <Widget>[Icon(icon), Text(text)],
        ),
        ),
      );

  bottomAppBar() => BottomAppBar(
          child: Container(
        height: bottomAppBarHeight(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            createBottomAppBarButton(0, Icons.today, "Today"),
            createBottomAppBarButton(1, Icons.show_chart, "Analytics"),
            createBottomAppBarButton(2, Icons.more_horiz, "More")
          ],
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageView(),
      bottomNavigationBar: bottomAppBar(),
    );
  }
}

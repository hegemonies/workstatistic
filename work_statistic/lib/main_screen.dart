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
          accentColor: Colors.indigoAccent,
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
  var currentIndex = 0;

  double bottomAppBarHeight(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 10;
    if (height > 75) {
      return 75;
    } else {
      return height;
    }
  }

  double pageHeight(BuildContext context) =>
      MediaQuery.of(context).size.height - bottomAppBarHeight(context);

  double bottomAppBarButtonWidth(BuildContext context) =>
      MediaQuery.of(context).size.width / countOfPage;

  pageView() => PageView(
        controller: pageController,
        children: <Widget>[
          Center(
            child:
                Container(height: pageHeight(context), child: widget.todayPage),
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

  createBottomNavigationBarItem(IconData icon, String title) =>
      BottomNavigationBarItem(
          icon: Icon(icon),
          title: Text(title));

  bottomNavigationBar() => BottomNavigationBar(
          fixedColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              pageController.animateToPage(currentIndex,
                  duration: Duration(milliseconds: 300), curve: Curves.ease);
            });
          },
          items: [
            createBottomNavigationBarItem(Icons.today, "Today"),
            createBottomNavigationBarItem(Icons.show_chart, "Analytics"),
            createBottomNavigationBarItem(Icons.more_horiz, "More"),
          ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageView(),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}

import 'package:admu_qpi_calculator/widgets/fab_bottom_app_bar.dart';
import 'package:admu_qpi_calculator/screens/home.dart';
import 'package:admu_qpi_calculator/screens/settings.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: ' AdMU Student App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MainScreen(title: 'AdMU QPI Calculator'),
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => new _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;

  var pages = [
    HomeScreen(),
    SettingsScreen(),
  ];

  void _selectedTab(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: pages[selectedPageIndex],
        bottomNavigationBar: FABBottomAppBar(
          // centerItemText: 'Add Grades',
          color: Colors.grey,
          selectedColor: Colors.blue,
          notchedShape: CircularNotchedRectangle(),
          onTabSelected: _selectedTab,
          items: [
            FABBottomAppBarItem(iconData: Icons.dashboard, text: 'Home'),
            FABBottomAppBarItem(iconData: Icons.settings, text: 'Settings'),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Floating Add Button Clicked");
          },
          tooltip: 'Add',
          child: Icon(Icons.add),
          elevation: 2.0,
        ));
  }
}

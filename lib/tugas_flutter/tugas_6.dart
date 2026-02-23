import 'package:flutter/material.dart';
// import 'package:ppkd';

class TugasTujuh extends StatefulWidget {
  const TugasTujuh({super.key});

  @override
  State<TugasTujuh> createState() => _TugasTujuhState();
}

class _TugasTujuhState extends State<TugasTujuh> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void ontapItem(int index) {
    _currentIndex = index;
    setState(() {});
  }

  void ontapItemDrawer(int index) {
    _currentIndex = index;
    setState(() {});
    // context.pop();
  }

  static List<Widget> listWidget = [
    Text("Data 1"),
    Text("Data 2"),
    Text("Data 3")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Widget"),
        // centerTitle: true,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () => _scaffoldKey.currentState?.openDrawer(),
        )
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(color: Colors.blue),
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {
                ontapItemDrawer(0);
              },
            ),
            ListTile(
              title: Text("Search"),
              onTap: () {
                ontapItemDrawer(1);
              },
            ),
            ListTile(
              title: Text("Person"),
              onTap: () {
                ontapItemDrawer(2);
              },
            )
          ],
        ),
      ),
      body: listWidget.elementAt(_currentIndex),
    );
  }
}
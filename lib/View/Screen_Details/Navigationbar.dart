import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ths/Res/AppContextExtension.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:ths/View_Model/AppbarModelView.dart';
import 'Intervention.dart';
import 'Notification.dart';
import 'dashboard.dart';

class NavigationBar extends StatefulWidget {
  NavigationBar({Key? key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int selectedPage = 1;
  final _pageOptions = [
    Interventions(),
    Dashboard(),
    Notifications(),
  ];

  @override
  Widget build(BuildContext context) {
    var data = AppbarWidget();
    return Scaffold(
      body: _pageOptions[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        color: Colors.black,
        backgroundColor: Colors.white,
        activeColor: context.resources.color.bleumarineO,
        //cornerRadius: 30,
        items: [
          TabItem(icon: Icons.assignment, title: data.intervention),
          TabItem(icon: Icons.home, title: data.home),
          TabItem(icon: Icons.notifications, title: data.notif),
        ],
        initialActiveIndex: selectedPage,
        //optional, default as 0
        onTap: (int index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weatherapp/view/pages/Dashboard/DashboardScreen.dart';
import 'package:weatherapp/view/pages/Dashboard/ListScreen.dart';
import 'package:weatherapp/view/pages/Profile/ProfileScreen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;
  late List<Widget> _children;
  @override
  void initState() {
    _currentIndex = 0;

    _children = [
      DashboardScreen(),
      ListScreen(),
      ProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(135, 206, 235, 1),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: "News",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.black.withBlue(100),
      ),
    );
  }
}

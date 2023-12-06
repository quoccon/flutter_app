import 'package:flutter/material.dart';
import 'package:flutter_app/screen/home.sreen.dart';
import 'package:flutter_app/screen/notification.screen.dart';
import 'package:flutter_app/screen/profile.screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  static const List<Widget> widgetOptons = <Widget>[
    HomeScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];

  void onItemTap(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptons.elementAt(selectedIndex),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items:const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notification",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: onItemTap,
      ),
    );
  }
}


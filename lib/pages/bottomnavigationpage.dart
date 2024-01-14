import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/page1.dart';
import 'package:flutter_application_3/pages/page2.dart';

class BottomNavigationPage extends StatefulWidget {
  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int currentIndex = 0;

  List pages = [
    FirstPage(),
    SecondPage(),
    SecondPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBody: true,
      body: pages[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        index: currentIndex,
        onTap: (value) {
          setState(() {});
          currentIndex = value;
          print(currentIndex);
        },
        items: [
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.search, size: 30),
        ],
      ),
    );
  }
}

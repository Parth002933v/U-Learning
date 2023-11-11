import 'package:flutter/material.dart';
import 'package:ulearning/features/home/view/home.dart';

List<BottomNavigationBarItem> get bottomTab => [
      const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined), label: 'home'),
      const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.play_arrow), label: 'play'),
      const BottomNavigationBarItem(icon: Icon(Icons.message), label: 'play'),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'play'),
    ];

Widget ScreenOfIndex({required int index}) {
  List<Widget> screens = [
    Home(),
    Center(child: Icon(Icons.search)),
    Center(child: Icon(Icons.play_arrow)),
    Center(child: Icon(Icons.message)),
    Center(child: Icon(Icons.person)),
  ];

  return screens[index];
}

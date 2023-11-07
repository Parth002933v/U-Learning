import 'package:flutter/material.dart';
import 'package:ulearning/common/routes/route_name_constants.dart';
import 'package:ulearning/global.dart';

List<BottomNavigationBarItem> get bottomTab => [
      const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined), label: 'home'),
      const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.play_arrow), label: 'play'),
      const BottomNavigationBarItem(icon: Icon(Icons.message), label: 'play'),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'play'),
    ];

Widget ScreenOfIndex({required int index, required BuildContext context}) {
  List<Widget> screens = [
    Center(
        child: TextButton(
            onPressed: () {
              Global.storageServices.logout().then(
                    (value) => Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRouteConstants.SIGN_IN, (route) => false),
                  );
            },
            child: Text('LogOut'))),
    Center(child: Icon(Icons.search)),
    Center(child: Icon(Icons.play_arrow)),
    Center(child: Icon(Icons.message)),
    Center(child: Icon(Icons.person)),
  ];

  return screens[index];
}

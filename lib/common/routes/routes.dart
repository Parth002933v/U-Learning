import 'package:flutter/material.dart';
import 'package:ulearning/common/routes/route_name_constants.dart';
import 'package:ulearning/features/application/view/application.dart';
import 'package:ulearning/features/home/view/home.dart';
import 'package:ulearning/features/sign_in/view/sign_in.dart';
import 'package:ulearning/features/sign_up/view/sign_up.dart';
import 'package:ulearning/features/welcome/view/welcome.dart';
import 'package:ulearning/global.dart';

class AppRoutes {
  static List<RouteEntity> routes = [
    RouteEntity(path: AppRouteConstants.WELCOME, page: const Welcome()),
    RouteEntity(path: AppRouteConstants.SIGN_IN, page: const SignIn()),
    RouteEntity(path: AppRouteConstants.SIGN_UP, page: const SignUp()),
    RouteEntity(path: AppRouteConstants.APPLICATION, page: const Application()),
    RouteEntity(path: AppRouteConstants.HOME, page: const Home()),
  ];

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes.where((r) => r.path == settings.name);

      if (result.isNotEmpty) {
        /// if device is opened first time or not
        bool deviceFirstTime = Global.storageServices.getDeviceFirstTimeOpen();

        if (result.first.path == AppRouteConstants.WELCOME && deviceFirstTime) {
          bool isLoggedIn = Global.storageServices.isLoggedIn();

          /// already login
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const Application(), settings: settings);
          } else {
            return MaterialPageRoute(
                builder: (_) => const SignIn(), settings: settings);
          }
        } else {
          return MaterialPageRoute(
              builder: (_) => result.first.page, settings: settings);
        }
      }
    }
    return MaterialPageRoute(
        builder: (_) => const Welcome(), settings: settings);
  }
}

class RouteEntity {
  String path;
  Widget page;
  RouteEntity({required this.path, required this.page});
}

import 'package:flutter/material.dart';
import '../pages/home.dart';
import '../pages/profile.dart';
import '../pages/map.dart';

export '../pages/home.dart';
export '../pages/map.dart';
export '../pages/profile.dart';

Map<String, dynamic> routes = {
  Home.route: const Home(),
  MapScreen.route: const MapScreen(),
  Profile.route: const Profile()
};

PageRouteBuilder getAppRoutes(settings) {
  return PageRouteBuilder(
      settings: settings,
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          routes[settings.name],
      transitionsBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) =>
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ));
}

class ScreenArguments {
  ScreenArguments({this.direction, this.value});

  DirectionTransition? direction;
  dynamic value;
}

enum DirectionTransition { top, bottom, left, right }

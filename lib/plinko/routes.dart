// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:wins_pkr/plinko/lesson_menu.dart';

class Routes {
  static const menu = '/';
  static const lesson01 = '/lesson01';
  static const lesson02 = '/lesson02';
  static const lesson03 = '/lesson03';
  static const lesson04 = '/lesson04';
  static const lesson05 = '/lesson05';
  static const lesson06 = '/lesson06';
  static const lesson07 = '/lesson07';
  static const lesson08 = '/lesson08';
  static const lesson09 = '/lesson09';

  static Route routes(RouteSettings settings) {
    MaterialPageRoute _buildRoute(Widget widget) {
      return MaterialPageRoute(builder: (_) => widget, settings: settings);
    }

    switch (settings.name) {
      case menu:
        return _buildRoute(const LessonMenu());
      // case lesson02:
      //   return _buildRoute(MyGameWidget(game: GameLesson02()));
      default:
        throw Exception('Route does not exists');
    }
  }
}

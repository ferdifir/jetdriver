// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:jetdriver/screen/home_screen.dart';
import 'package:jetdriver/screen/login_screen.dart';
import 'package:jetdriver/screen/register_screen.dart';
import 'package:jetdriver/screen/splash_screen.dart';

class Routes {
  static const String LOGIN = '/login';
  static const String REGISTER = '/register';
  static const String HOME = '/home';
  static const String SPLASH = '/';

  static Map<String, WidgetBuilder> routes = {
    Routes.LOGIN: (context) => LoginScreen(),
    Routes.REGISTER: (context) => RegisterScreen(),
    Routes.HOME: (context) => HomeScreen(),
    Routes.SPLASH: (context) => SplashScreen(),
  };
}
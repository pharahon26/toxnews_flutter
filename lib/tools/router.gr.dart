// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/aboutView/about.dart';
import '../ui/views/homeView/home.dart';
import '../ui/views/logInView/logIn.dart';
import '../ui/views/signUpView/signUp.dart';
import '../ui/views/splashSreenView/splash_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String logIn = '/log-in';
  static const String signUp = '/sign-up';
  static const String home = '/Home';
  static const String about = '/About';
  static const all = <String>{
    splashScreen,
    logIn,
    signUp,
    home,
    about,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.logIn, page: LogIn),
    RouteDef(Routes.signUp, page: SignUp),
    RouteDef(Routes.home, page: Home),
    RouteDef(Routes.about, page: About),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreen: (data) {
      final args = data.getArgs<SplashScreenArguments>(
        orElse: () => SplashScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashScreen(key: args.key),
        settings: data,
      );
    },
    LogIn: (data) {
      final args = data.getArgs<LogInArguments>(
        orElse: () => LogInArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => LogIn(key: args.key),
        settings: data,
      );
    },
    SignUp: (data) {
      final args = data.getArgs<SignUpArguments>(
        orElse: () => SignUpArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUp(key: args.key),
        settings: data,
      );
    },
    Home: (data) {
      final args = data.getArgs<HomeArguments>(
        orElse: () => HomeArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => Home(key: args.key),
        settings: data,
      );
    },
    About: (data) {
      final args = data.getArgs<AboutArguments>(
        orElse: () => AboutArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => About(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// SplashScreen arguments holder class
class SplashScreenArguments {
  final Key key;
  SplashScreenArguments({this.key});
}

/// LogIn arguments holder class
class LogInArguments {
  final Key key;
  LogInArguments({this.key});
}

/// SignUp arguments holder class
class SignUpArguments {
  final Key key;
  SignUpArguments({this.key});
}

/// Home arguments holder class
class HomeArguments {
  final Key key;
  HomeArguments({this.key});
}

/// About arguments holder class
class AboutArguments {
  final Key key;
  AboutArguments({this.key});
}

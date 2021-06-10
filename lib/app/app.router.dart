// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../models/FlashNews.dart';
import '../ui/views/aboutView/about.dart';
import '../ui/views/flashNewsUnitView/flashNewsUnitView.dart';
import '../ui/views/homeView/home.dart';
import '../ui/views/logInView/logIn.dart';
import '../ui/views/newspaperUnitView/newspaperUnitView.dart';
import '../ui/views/signUpView/signUp.dart';
import '../ui/views/splashSreenView/splash_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String logIn = '/log-in';
  static const String signUp = '/sign-up';
  static const String home = '/Home';
  static const String newspaperUnitView = '/newspaper-unit-view';
  static const String flashNewsUnitView = '/flash-news-unit-view';
  static const String about = '/About';
  static const all = <String>{
    splashScreen,
    logIn,
    signUp,
    home,
    newspaperUnitView,
    flashNewsUnitView,
    about,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.logIn, page: LogIn),
    RouteDef(Routes.signUp, page: SignUp),
    RouteDef(Routes.home, page: Home),
    RouteDef(Routes.newspaperUnitView, page: NewspaperUnitView),
    RouteDef(Routes.flashNewsUnitView, page: FlashNewsUnitView),
    RouteDef(Routes.about, page: About),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashScreen(),
        settings: data,
      );
    },
    LogIn: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LogIn(),
        settings: data,
      );
    },
    SignUp: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUp(),
        settings: data,
      );
    },
    Home: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Home(),
        settings: data,
      );
    },
    NewspaperUnitView: (data) {
      var args = data.getArgs<NewspaperUnitViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => NewspaperUnitView(path: args.path),
        settings: data,
      );
    },
    FlashNewsUnitView: (data) {
      var args = data.getArgs<FlashNewsUnitViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => FlashNewsUnitView(news: args.news),
        settings: data,
      );
    },
    About: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => About(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// NewspaperUnitView arguments holder class
class NewspaperUnitViewArguments {
  final String path;
  NewspaperUnitViewArguments({required this.path});
}

/// FlashNewsUnitView arguments holder class
class FlashNewsUnitViewArguments {
  final FlashNews news;
  FlashNewsUnitViewArguments({required this.news});
}

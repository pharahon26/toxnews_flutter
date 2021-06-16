// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../models/FlashNews.dart';
import '../models/Newspaper.dart';
import '../ui/views/aboutView/about.dart';
import '../ui/views/companyUnitView/companyUnitView.dart';
import '../ui/views/flashNewsUnitView/flashNewsUnitView.dart';
import '../ui/views/homeView/home.dart';
import '../ui/views/logInView/logIn.dart';
import '../ui/views/newspaperUnitView/newspaperUnitView.dart';
import '../ui/views/newspaperViewer/newspaperViewer.dart';
import '../ui/views/personalCompanyView/personalCompanyView.dart';
import '../ui/views/personalFlashNewsView/personalFlashNewsView.dart';
import '../ui/views/personalNewspaperView/personalNewspaperView.dart';
import '../ui/views/profileView/profile.dart';
import '../ui/views/signUpView/signUp.dart';
import '../ui/views/splashSreenView/splash_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String logIn = '/log-in';
  static const String signUp = '/sign-up';
  static const String home = '/Home';
  static const String newspaperUnitView = '/newspaper-unit-view';
  static const String flashNewsUnitView = '/flash-news-unit-view';
  static const String newspaperViewer = '/newspaper-viewer';
  static const String companyUnitView = '/company-unit-view';
  static const String personalNewspaperView = '/personal-newspaper-view';
  static const String personalFlashNewsView = '/personal-flash-news-view';
  static const String personalCompanyView = '/personal-company-view';
  static const String about = '/About';
  static const String profileView = '/profile-view';
  static const all = <String>{
    splashScreen,
    logIn,
    signUp,
    home,
    newspaperUnitView,
    flashNewsUnitView,
    newspaperViewer,
    companyUnitView,
    personalNewspaperView,
    personalFlashNewsView,
    personalCompanyView,
    about,
    profileView,
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
    RouteDef(Routes.newspaperViewer, page: NewspaperViewer),
    RouteDef(Routes.companyUnitView, page: CompanyUnitView),
    RouteDef(Routes.personalNewspaperView, page: PersonalNewspaperView),
    RouteDef(Routes.personalFlashNewsView, page: PersonalFlashNewsView),
    RouteDef(Routes.personalCompanyView, page: PersonalCompanyView),
    RouteDef(Routes.about, page: About),
    RouteDef(Routes.profileView, page: ProfileView),
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
        builder: (context) => NewspaperUnitView(newspaper: args.newspaper),
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
    NewspaperViewer: (data) {
      var args = data.getArgs<NewspaperViewerArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => NewspaperViewer(path: args.path),
        settings: data,
      );
    },
    CompanyUnitView: (data) {
      var args = data.getArgs<CompanyUnitViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => CompanyUnitView(companyId: args.companyId),
        settings: data,
      );
    },
    PersonalNewspaperView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PersonalNewspaperView(),
        settings: data,
      );
    },
    PersonalFlashNewsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PersonalFlashNewsView(),
        settings: data,
      );
    },
    PersonalCompanyView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PersonalCompanyView(),
        settings: data,
      );
    },
    About: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => About(),
        settings: data,
      );
    },
    ProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfileView(),
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
  final Newspaper newspaper;
  NewspaperUnitViewArguments({required this.newspaper});
}

/// FlashNewsUnitView arguments holder class
class FlashNewsUnitViewArguments {
  final FlashNews news;
  FlashNewsUnitViewArguments({required this.news});
}

/// NewspaperViewer arguments holder class
class NewspaperViewerArguments {
  final String path;
  NewspaperViewerArguments({required this.path});
}

/// CompanyUnitView arguments holder class
class CompanyUnitViewArguments {
  final String companyId;
  CompanyUnitViewArguments({required this.companyId});
}

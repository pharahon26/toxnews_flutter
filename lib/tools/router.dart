import 'package:auto_route/auto_route_annotations.dart';
import 'package:toxnews/ui/views/homeView/home.dart';
import 'package:toxnews/ui/views/logInView/logIn.dart';
import 'package:toxnews/ui/views/signUpView/signUp.dart';
import 'package:toxnews/ui/views/splashSreenView/splash_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: LogIn),
    MaterialRoute(page: SignUp),
    MaterialRoute(page: Home),
  ]
)
class $Router {
}
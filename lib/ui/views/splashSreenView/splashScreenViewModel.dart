
import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:toxnews/services/FirebaseAuhService.dart';
import 'package:toxnews/tools/locator.dart';
import 'package:toxnews/tools/router.gr.dart';

class SplashScreenViewModel extends BaseViewModel{
  final NavigationService _navigationService = locator<NavigationService>();
  final FirebaseAuthService _authService = locator<FirebaseAuthService>();


  Future handleStartUpLogic() async {
    var hasLoggedInUser = await _authService.isUserLoggedIn();
    Timer(Duration(seconds: 2), (){
      if (hasLoggedInUser) {
        navigateToHome();
      } else {
        navigateToLogIn();
      }
    });
  }

  void navigateToHome(){
    _navigationService.navigateTo(Routes.home);
  }

  void navigateToLogIn(){
    _navigationService.navigateTo(Routes.logIn);
  }

}
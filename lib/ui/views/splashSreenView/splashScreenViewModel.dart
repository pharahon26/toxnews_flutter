
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:toxnews/tools/locator.dart';
import 'package:toxnews/tools/router.gr.dart';

class SplashScreenViewModel extends BaseViewModel{
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToHome(){
    _navigationService.navigateTo(Routes.home);
  }

  void navigateToSignUp(){
    _navigationService.navigateTo(Routes.signUp);
  }

  void navigateToLogIn(){
    _navigationService.navigateTo(Routes.logIn);
  }

}
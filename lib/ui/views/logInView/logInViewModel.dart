
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:toxnews/app/app.locator.dart';
import 'package:toxnews/app/app.router.dart';
import 'package:toxnews/services/FirebaseAuhService.dart';


class LogInViewModel extends BaseViewModel{
  final FirebaseAuthService _authService = locator<FirebaseAuthService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String _mail = '';
  set mail(String value) {
    _mail = value;
  }

  String _password = '';
  set password(String value) {
    _password = value;
  }

  void navigateToHome(){
    _navigationService.navigateTo(Routes.home);
    dispose();
  }

  void navigateToSignUp(){
    _navigationService.navigateTo(Routes.signUp);
  }

  void logInWithEmailAndPassword() async {
    setBusy(true);
    var sign = await _authService.signInWithEmailAndPassword(mail: _mail, password: _password);
    setBusy(false);
    if(sign is bool){
      if(sign == true){
        navigateToHome();
      }
      else{
        _snackbarService.showSnackbar(
          title: 'Sign up',
          message: 'Error user not find',
          mainButtonTitle: 'OK',
        );
      }
    }
  }

  void logInWithGmail() async {
    setBusy(true);
    var sign = await _authService.signInWithGmail();
    setBusy(false);
    navigateToHome();

    print('lOiN vALUE 2 : $sign');
  }



}
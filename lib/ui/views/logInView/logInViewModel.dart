
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:toxnews/services/FirebaseAuhService.dart';
import 'package:toxnews/tools/locator.dart';
import 'package:toxnews/tools/router.gr.dart';

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
  }

  void navigateToSignUp(){
    _navigationService.navigateTo(Routes.signUp);
  }

  void logInWithEmailAndPassword() async {
    setBusy(true);
    await _authService.signInWithEmailAndPassword(mail: _mail, password: _password).then((value) {
      setBusy(false);
      if(value is bool){
        if(value == true){
          _snackbarService.showSnackbar(
              title: 'Sign up',
              message: 'User log in successfully',
              mainButtonTitle: 'OK',
          );
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
    });
  }

  void logInWithGmail() async {
    setBusy(true);
    await _authService.signInWithGmail().then((value) {
      setBusy(false);
      if(value is bool){
        if(value == true){
          _snackbarService.showSnackbar(
              title: 'Sign up',
              message: 'User log in successfully',
              mainButtonTitle: 'OK',
          );
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
    });
  }



}
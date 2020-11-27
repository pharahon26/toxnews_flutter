
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:toxnews/services/FirebaseAuhService.dart';
import 'package:toxnews/tools/locator.dart';
import 'package:toxnews/tools/router.gr.dart';

class SignUpViewModel extends BaseViewModel{
  final FirebaseAuthService _authService = locator<FirebaseAuthService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String _name = '';
  set name(String value) {
    _name = value;
  }

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

  void signUpWithEmailAndPassword() async {
    /// Sign up with email and password
    setBusy(true);
    await _authService.signUpWithEmailAndPassword(name: _name, mail: _mail, password: _password).then((value) {
      setBusy(false);
      if(value is bool){
        if(value == true){
          _snackbarService.showSnackbar(
              title: 'Sign up',
              message: 'User Created successfully',
              mainButtonTitle: 'OK',
          );
          navigateToHome();
        }
        else{
          _snackbarService.showSnackbar(
              title: 'Sign up',
              message: 'Error user Creation failed',
              mainButtonTitle: 'OK',
          );
        }
      }
    });
  }

  void signUpWithGmail() async {
    /// Sign up with Gmail
    setBusy(true);
    await _authService.signUpWithGmail().then((value) {
      setBusy(false);
      if(value is bool){
        if(value == true){
          _snackbarService.showSnackbar(
              title: 'Sign up',
              message: 'User Created successfully',
              mainButtonTitle: 'OK',
          );
          navigateToHome();
        }
        else{
          _snackbarService.showSnackbar(
              title: 'Sign up',
              message: 'Error user Creation failed',
              mainButtonTitle: 'OK',
          );
        }
      }
    });
  }


}
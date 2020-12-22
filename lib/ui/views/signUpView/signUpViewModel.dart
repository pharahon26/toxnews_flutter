
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

  bool _hasAgree = false;
  bool get hasAgree => _hasAgree;
  set hasAgree(bool value) {
    _hasAgree = value;
  }

  void navigateToHome(){
    _navigationService.navigateTo(Routes.home);
  }

  void signUpWithEmailAndPassword() async {
    /// Sign up with email and password
    if(_hasAgree){
      setBusy(true);
      var sign = await _authService.signUpWithEmailAndPassword(name: _name, mail: _mail, password: _password);
      setBusy(false);
      if(sign is bool){
        if(sign == true){
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
    }

  }

  void signUpWithGmail() async {
    /// Sign up with Gmail
    if (_hasAgree){
      setBusy(true);
      var sign = await _authService.signUpWithGmail();
      setBusy(false);
      if(sign is bool){
        if(sign == true){
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
    }

  }


}
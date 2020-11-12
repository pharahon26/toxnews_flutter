
import 'package:stacked/stacked.dart';

class SignInViewModel extends BaseViewModel{
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

  void signIn(){

  }
}
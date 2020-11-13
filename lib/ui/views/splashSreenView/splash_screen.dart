import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toxnews/ui/views/splashSreenView/splashScreenViewModel.dart';

/**
 * Created by Laty 26 PHARAHON entertainment on 11/11/2020.
 */
class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Column(
            children: [
              Image.asset('assets/tox_logo.png'),
              MaterialButton(
                  child: Text('Log In'),
                  onPressed: () => model.navigateToLogIn()
              ),
              MaterialButton(
                  child: Text('Sign Up'),
                  onPressed: () => model.navigateToSignUp()
              ),
              CircularProgressIndicator()
            ],
          ),
        ),
        viewModelBuilder: () => SplashScreenViewModel());
  }
}
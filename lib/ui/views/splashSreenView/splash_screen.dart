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
        onModelReady: (model) => model.handleStartUpLogic(),
        builder: (context, model, child) => Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            title: Text('Welcome',
              style: Theme.of(context).textTheme.headline6,
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColorDark,
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                      tag: 'tox_logo',
                      child: Image.asset('assets/tox_logo.png')
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CircularProgressIndicator()
                ],
              ),
            ),
          ),
        ),
        viewModelBuilder: () => SplashScreenViewModel());
  }
}
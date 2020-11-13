import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toxnews/ui/views/logInView/logInViewModel.dart';

/**
 * Created by Laty 26 PHARAHON entertainment on 11/11/2020.
 */
class LogIn extends StatefulWidget {
  LogIn({Key key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LogInViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
            children: [
              Image.asset('assets/tox_logo.png'),
              Form(child: Center(
                child: Column(
                  children: [
                    // Mail
                    TextFormField(
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: InputDecoration(
                          labelText: "Mail",
                          labelStyle: TextStyle(color: Theme.of(context).primaryColorDark),
                          enabledBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).primaryColorLight),
                          ) ,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                          ) ,
                          hintStyle: TextStyle(
                            color: Theme.of(context).accentColor,
                          )
                      ),
                      onChanged: (mail) {
                        model.mail = mail;
                      },
                    ),
                    // Password
                    TextFormField(
                      style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(color: Theme.of(context).primaryColorDark),
                            enabledBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).primaryColorLight),
                            ) ,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).primaryColor),
                            ) ,
                            hintStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                            )
                        ),
                      onChanged: (password){
                        model.password = password;
                      },
                    )
                    /// the buttons for the Social network next
                  ],
                ),
              )),
              MaterialButton(
                child: Text('Sign Up'),
                  onPressed: () => model.isBusy? null : model.logIn()
              )
            ],
          ),
        ),
        viewModelBuilder: () => LogInViewModel());
  }
}
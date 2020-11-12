import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toxnews/ui/views/signInView/signInViewModel.dart';

/**
 * Created by Laty 26 PHARAHON entertainment on 11/11/2020.
 */
class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
            children: [
              Image.asset('assets/tox_logo.png'),
              Form(child: Center(
                child: Column(
                  children: [
                    // Name
                    TextFormField(
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                      onChanged: (name){
                        model.name = name;
                      },
                    ),
                    // Mail
                    TextFormField(
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: InputDecoration(
                          labelText: 'Mail'
                      ),
                      onChanged: (mail) {
                        model.mail = mail;
                      },
                    ),
                    // Password
                    TextFormField(
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: InputDecoration(
                          labelText: 'Password'
                      ),
                      onChanged: (password){
                        model.password = password;
                      },
                    )
                    /// the buttons for the Social network next
                  ],
                ),
              )
              ),
              MaterialButton(
                child: Text('Create Profile'),
                  onPressed: () => model.signIn()
              )
            ],
          ),
        ),
        viewModelBuilder: () => SignInViewModel());
  }
}
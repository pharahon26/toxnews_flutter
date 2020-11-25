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
          appBar: AppBar(
            title: Text('Log In',
              style: Theme.of(context).textTheme.headline6,
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColorDark,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset('assets/tox_logo.png',
                  height: 75.0,
                  width: 75.0,
                ),
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [

                      SizedBox(
                        height: 10.0,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RaisedButton(
                                  color: Colors.red,
                                  child: Text('Gmail',
                                    style: Theme.of(context).textTheme.headline6,
                                  ),
                                  onPressed: () => model.isBusy? null : model.logInWithGmail()
                              ),
                              MaterialButton(
                                child: Text('Log in',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                  onPressed: () => model.isBusy? null : model.logInWithEmailAndPassword()
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          RaisedButton(
                              color: Theme.of(context).accentColor,
                              child: Text('Sign Up',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              onPressed: () => model.navigateToSignUp()
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text('Please Sign Up if you are new In this adventure',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        viewModelBuilder: () => LogInViewModel());
  }
}
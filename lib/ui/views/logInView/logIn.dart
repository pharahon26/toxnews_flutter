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
            automaticallyImplyLeading: false,
            title: Text('Log In',
              style: Theme.of(context).textTheme.headline4,
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColorDark,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      /// WELCOME TEXT
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Welcome back to ',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text('Toxnews',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff30B19F)
                            ),
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text('Sign In',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      // Mail
                      TextFormField(
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                            labelText: "Mail",
                            labelStyle: TextStyle(color: Theme.of(context).primaryColorDark),
                            enabledBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).primaryColorDark),
                            ) ,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).primaryColor),
                            ) ,
                            hintStyle: TextStyle(
                              color: Theme.of(context).accentColor.withAlpha(200),
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
                                borderSide: BorderSide(color: Theme.of(context).primaryColorDark),
                              ) ,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Theme.of(context).primaryColor),
                              ) ,
                              hintStyle: TextStyle(
                                color: Theme.of(context).accentColor.withOpacity(0.8),
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Column(
                        children: [
                          /// SIGN UP LINK
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Newcomer? not for long ',
                                style: TextStyle(fontSize: 12.0, color: Colors.black ),
                              ),
                              GestureDetector(
                                child: Text(' Sign up',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                  onTap: () => model.navigateToSignUp(),
                              ),

                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          MaterialButton(
                              minWidth: double.maxFinite,
                              color: Colors.red,
                              child: Text('Log in with your google account',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              onPressed: () => model.isBusy? null : model.logInWithGmail()
                          ),
                          SizedBox(
                            width: 40.0,
                          ),
                          MaterialButton(
                            minWidth: double.maxFinite,
                            color: Theme.of(context).primaryColorDark,
                              child: Text('Log in',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              onPressed: () => model.isBusy? null : model.logInWithEmailAndPassword()
                          ),
                          SizedBox(
                            height: 10.0,
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
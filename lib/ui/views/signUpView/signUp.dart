import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toxnews/ui/views/signUpView/signUpViewModel.dart';

/**
 * Created by Laty 26 PHARAHON entertainment on 11/11/2020.
 */
class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            title: Text('Register',
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
                          Text('Welcome to ',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text('TOXNEWS',
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
                      Text('Sign Up',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      // Name
                      TextFormField(
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                            labelText: "Name",
                            labelStyle: TextStyle(color: Theme.of(context).primaryColorDark),
                            enabledBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).primaryColorDark),
                            ) ,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).primaryColor),
                            ) ,
                            hintStyle: TextStyle(
                              color: Theme.of(context).accentColor,
                            )
                        ),
                        onChanged: (name){
                          model.name = name;
                        },
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
                              Text('You may agree to our ',
                                style: TextStyle(fontSize: 12.0, color: Colors.black ),
                              ),
                              /// terms and conditions
                              GestureDetector(
                                child: Text('Terms and Conditions',
                                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Color(0xff30B19F)),
                                ),
                                onTap: () {
                                  /// show dialog
                                },
                              ),
                              Text(',',
                                style: TextStyle(fontSize: 12.0, color: Colors.black ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('and ',
                                style: TextStyle(fontSize: 12.0, color: Colors.black ),
                              ),
                              /// Privacy Policy
                              GestureDetector(
                                child: Text('Privacy Policy',
                                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Color(0xff30B19F)),
                                ),
                                onTap: () {
                                  /// show dialog
                                },
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 10.0,
                          ),
                          /// google sign in
                          MaterialButton(
                              minWidth: double.maxFinite,
                              color: Colors.red,
                              child: Text('Sign up with google account',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              onPressed: () => model.isBusy? null : model.signUpWithGmail()
                          ),
                          SizedBox(
                            width: 40.0,
                          ),
                          /// email and password sign in
                          MaterialButton(
                              minWidth: double.maxFinite,
                              color: Theme.of(context).primaryColorDark,
                              child: Text('Sign Up with mail',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              onPressed: () => model.isBusy? null : model.signUpWithEmailAndPassword()
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
        viewModelBuilder: () => SignUpViewModel());
  }
}
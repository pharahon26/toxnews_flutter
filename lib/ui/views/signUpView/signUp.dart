import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toxnews/generated/l10n.dart';
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
            title: Text(S.of(context).pageNameRegister,
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
                          Text(S.of(context).textWelcome,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(S.of(context).appTitle,
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
                      Text(S.of(context).pageNameSignUp,
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
                            labelText: S.of(context).buttonName,
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
                            labelText: S.of(context).buttonMail,
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
                            labelText: S.of(context).buttonPassword,
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
                              Text(S.of(context).textAgree,
                                style: TextStyle(fontSize: 12.0, color: Colors.black ),
                              ),
                              /// terms and conditions
                              GestureDetector(
                                child: Text(S.of(context).textTerms,
                                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Color(0xff30B19F)),
                                ),
                                onTap: (){
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: true,
                                    // false = user must tap button, true = tap outside dialog
                                    builder: (BuildContext dialogContext) {
                                      return AlertDialog(
                                        title: Text(S.of(context).textTerms),
                                        content: SingleChildScrollView(
                                          child: Text(S.of(context).textTermsText,
                                              style: TextStyle(fontSize: 12.0, color: Colors.black )
                                          ),
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text(S.of(context).buttonClose,
                                                style: TextStyle(fontSize: 12.0, color: Theme.of(context).accentColor )
                                            ),
                                            onPressed: () {
                                              Navigator.of(dialogContext)
                                                  .pop(); // Dismiss alert dialog
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
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
                              Text(S.of(context).textAnd,
                                style: TextStyle(fontSize: 12.0, color: Colors.black ),
                              ),
                              /// Privacy Policy
                              GestureDetector(
                                child: Text(S.of(context).privacy,
                                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Color(0xff30B19F)),
                                ),
                                onTap: () {
                                  /// show dialog
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: true,
                                    // false = user must tap button, true = tap outside dialog
                                    builder: (BuildContext dialogContext) {
                                      return AlertDialog(
                                        title: Text(S.of(context).privacy),
                                        content: SingleChildScrollView(
                                          child: Text(S.of(context).privacyText,
                                              style: TextStyle(fontSize: 12.0, color: Colors.black )
                                          ),
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text(S.of(context).buttonClose,
                                                  style: TextStyle(fontSize: 12.0, color: Theme.of(context).accentColor )
                                              ),
                                            onPressed: () {
                                              Navigator.of(dialogContext)
                                                  .pop(); // Dismiss alert dialog
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          CheckboxListTile(
                              value: model.hasAgree,
                              onChanged: (check){
                                setState(() {
                                  model.hasAgree = check;
                                });
                              },
                            title: Text( S.of(context).textGiveAgreement,
                              style: TextStyle(fontSize: 14.0, color: Colors.black ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          /// google sign in
                          MaterialButton(
                              minWidth: double.maxFinite,
                              color: Colors.red,
                              child: Text(S.of(context).buttonGoogleSignUp,
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
                              child: Text(S.of(context).pageNameSignUp,
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
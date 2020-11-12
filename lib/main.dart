import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text(
              snapshot.error.toString()
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'ToxNews',
            theme: ThemeData(
              primaryColor: Color(0xff1DE9B6),
              primaryColorDark: Color(0xff30B19F),
              primaryColorLight: Color(0xff70F8D6),
              accentColor: Color(0xffD500F9),
              hintColor: Color(0xffD82CF5),
              backgroundColor: Colors.blueGrey,

              fontFamily: "Times New Roman",

              textTheme: TextTheme(
                headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                headline6: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
                bodyText1: TextStyle(fontSize: 12.0),
                bodyText2: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
              ),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator(
        );
      },
    );
  }
}


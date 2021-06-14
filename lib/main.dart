import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stacked_services/stacked_services.dart';


import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'generated/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
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
          print(snapshot.hasError.toString());
          return MaterialApp(
            home: Container(
              child: Center(
                child: Text(
                    snapshot.error.toString(),
                  style: TextStyle(
                    fontSize: 14.0
                  ),
                ),
              ),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              S.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'Toxnews',
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.splashScreen,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            navigatorKey: StackedService.navigatorKey,
            theme: ThemeData(
              primaryColor: Color(0xff065143),
              primaryColorDark: Color(0xff04392f),
              primaryColorLight: Color(0xff0a856e),
              accentColor: Color(0xff901317),
              hintColor: Color(0xff7c6c77),
              backgroundColor: Color(0xff001c55),
              cardColor: Color(0xff15b097),
              fontFamily: "Times New Roman",

              textTheme: TextTheme(
                headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
                headline2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xff0a856e)),
                headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.amber),
                headline4: TextStyle(fontSize: 20.0, color: Colors.white),
                headline5: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Color(0xffD500F9)),
                headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black ),
                bodyText1: TextStyle(fontSize: 14.0, color: Colors.white ),
                bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Color(0xff30B19F)),
              ),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          home: Container(
            child: CircularProgressIndicator(
            ),
          ),
        );
      },
    );
  }
}


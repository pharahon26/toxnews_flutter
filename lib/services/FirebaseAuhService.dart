import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:toxnews/models/ToxNewsUsers.dart';
import 'package:toxnews/services/FirebaseFirestoreService.dart';
import 'package:toxnews/tools/locator.dart';

@lazySingleton
class FirebaseAuthService {
  FirebaseFirestoreService _firestoreService = locator<FirebaseFirestoreService>();

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User _user ;

  FirebaseAuthService(){
    _firebaseAuth.userChanges().listen((event) async {
      _user = event;
      await getUserData(_user.uid);
    });
  }

  ///check the current user
  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser;
    return user != null;
  }

  /// SignUp Method
  Future signUpWithEmailAndPassword({@required String name, @required String mail, @required String password}) async {
    /// Sign up with the mail and password provided
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: mail, password: password);
      /// call the function to create user data in firestore
      ToxNewsUsers users = ToxNewsUsers.builder(userCredential.user.uid, name, userCredential.user.email, '');
      await createUserData(users);
      return userCredential.user != null;
    } catch (e) {
      print('${e.toString()}');
      return e.message;
    }

  }

  Future signUpWithGmail() async {
    /// Sign up with the Gmail profile
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    /// call the function to create user data in firestore

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential).then((value) async {
      ToxNewsUsers users = ToxNewsUsers.builder(value.user.uid, value.user.displayName, value.user.email, '');
      await createUserData(users);
    });
  }

  /// logIn Method
  Future signInWithEmailAndPassword({@required String mail, @required String password}) async {
    /// Sign In with the mail and password provided
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: mail, password: password).then((value) async {
        if (value.user != null) {
          await getUserData(value.user.uid);
        }
        return value;
      });
      /// call the function to get user data in firestore
      return userCredential.user != null;
    } catch (e) {
      print(e);
      return e.message;
    }

  }

  Future signInWithGmail() async {
    /// Sign In with the Gmail profile
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    /// call the function to get user data in firestore

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential).then((value) async {
      if (value.user != null) {
        await getUserData(value.user.uid);
      }
    });
  }

  /// logOut Method
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  /// interact with user data in firestore
  Future createUserData(ToxNewsUsers users) async {
    /// create user data from firestore
    await _firestoreService.createUserData(users);
  }

  Future getUserData(String id) async{
    /// get user data from firestore
    await _firestoreService.getUserData(id);
  }

Future updateUserData(ToxNewsUsers users) async {
    /// update user data from firestore
    _firestoreService.updateUserData(users);
  }
}
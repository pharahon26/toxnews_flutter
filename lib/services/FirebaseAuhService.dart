import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  /// SignUp Method
  Future signUpWithEmailAndPassword({@required String mail, @required String password}) async {
    /// Sign up with the mail and password provided
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: mail, password: password);
      /// call the function to create user data in firestore
      return userCredential.user != null;
    } catch (e) {
      print('${e.toString()}');
    }

  }

  Future signUpWithGmail({@required String mail, @required String password}) async {
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
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  /// logIn Method
  Future signInWithEmailAndPassword({@required String mail, @required String password}) async {
    /// Sign In with the mail and password provided
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: mail, password: password);
      /// call the function to get user data in firestore
      return userCredential.user != null;
    } catch (e) {
      print(e);
    }

  }

  Future signInWithGmail({@required String mail, @required String password}) async {
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
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  /// logOut Method

  /// interact with user data in firestore
  Future createUserData(){
    /// create user data from firestore
  }

  Future getUserData(){
    /// get user data from firestore
  }

Future updateUserData(){
    /// update user data from firestore
  }

Future deleteUserData(){
    /// delete user data from firestore
  }

}
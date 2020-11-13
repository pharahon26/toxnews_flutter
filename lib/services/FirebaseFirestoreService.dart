import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:toxnews/models/ToxNewsUsers.dart';

@lazySingleton
class FirebaseFirestoreService{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference _user_collection;
  ToxNewsUsers _toxNewsUser;

  FirebaseFirestoreService(){
    _user_collection = _firestore.collection(ToxNewsUsers.REF_FIREBASE_FIRESTORE);
  }

  /// User Data Interactions
  /// Create User data
  Future createUserData(ToxNewsUsers users) async {
    if (_user_collection != null){
      await _user_collection.add(users.toMap()).catchError((error) => print("Failed to add user: $error"));
    }
  }

  /// Get User data
  Future getUserData(String id) async {
    _user_collection.doc(id).snapshots().listen((event) {
      _toxNewsUser = event.data() as ToxNewsUsers;
    });
    return _toxNewsUser;
  }

  /// update User data
  Future updateUserData(ToxNewsUsers users) async {
    if (_user_collection != null){
      await _user_collection.doc(users.id).update(users.toMap()).catchError((error) => print("Failed to add user: $error"));
    }
  }
  /// FlashNews interactions
}
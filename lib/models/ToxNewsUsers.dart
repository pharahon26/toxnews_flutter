import 'package:json_annotation/json_annotation.dart';

part 'ToxNewsUsers.g.dart';

/// The User class that represent the user data
@JsonSerializable()
class ToxNewsUsers{

  // variables
  // ID
  String id = '';
  //MAIL
  String mail = '';
  //NAME
  String name = ' ';
  // NUMBER
  String number = ' ';
  // USER IMAGE
  String image = ' ';
  // IS SUBSCRIBER
  bool subscriber = false;
  /// NEWSPAPER **STATE** {onw, download, like, unlike, trend, comment}
  Map<String, int> newspapers = {};
  /// FLASHNEWS **STATE** {like, unlike, trend, comment, watch}
  Map<String, int> flashNews = {};
  /// COMPANIES **STATE** {like, trend, comment, follow, subscribe}
  Map<String, int> companies = {};
  /// COMMENT **STATE** {onw, like, trend, comment, watch}
  Map<String, int> comments = {};

  // CATEGORY
  List<String> favoriteCategories = [];

  //firebase firestore reference
  static const String REF_FIREBASE_FIRESTORE = 'Users';

  ToxNewsUsers();

  ToxNewsUsers.builder(this.id, this.name, this.mail, this.number){
    /// create a new user Object with subscriber = false, that means that
    /// a user create in the app is consider as if he is not related to a company
    subscriber = false;
  }

  Map<String, dynamic> toJson() => _$ToxNewsUsersToJson(this);

  /// create user from map data usually from firebase
   factory ToxNewsUsers.fromJson(Map<String, dynamic> json) => _$ToxNewsUsersFromJson(json);


}
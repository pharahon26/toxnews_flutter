import 'package:json_annotation/json_annotation.dart';

part 'NewspaperCompany.g.dart';

/// represent de company info
@JsonSerializable()
class NewspaperCompany{
  /// VARIABLES
  ///  ID
  String id = '';
  /// LOGO URL
  String logoURL = '';
  /// NAME
  String name = '';
  /// COUNTRY
  String country = '';
  /// CITY
  String city = '';
  /// MAIL
  List<String> mail = [];
  /// NEWSPAPER
  List<String> newspapers = [];
  /// FLASHNEWS
  List<String> flashNews = [];
  /// PHONE NUMBER
  List<num> phoneNumber = [];
  /// COMMENTS
  List<String> comments = [];
  /// FOLLOWERS
  int followers = 0;
  /// TRENDS
  int trends = 0;
  /// LIKES
  int likes = 0;
  /// LEVEL
  int level = 0;


  //firebase firestore reference
  static const String REF_FIREBASE_FIRESTORE = 'Company';

  NewspaperCompany();

  Map<String, dynamic> toJson() => _$NewspaperCompanyToJson(this);

  /// create Company from map data usually from firebase
  factory NewspaperCompany.fromJson(Map<String, dynamic> json) => _$NewspaperCompanyFromJson(json);

}
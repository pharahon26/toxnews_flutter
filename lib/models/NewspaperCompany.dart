import 'package:json_annotation/json_annotation.dart';

part 'NewspaperCompany.g.dart';

/// represent de company info
@JsonSerializable()
class NewspaperCompany{
  /// VARIABLES
  //  ID
  String _id = '';
  String get id => _id;
  set id(String value) {
    _id = value;
  }
  // LOGO URL
  String _logoURL = '';
  String get logoURL => _logoURL;
  set logoURL(String value) {
    _logoURL = value;
  }
  // NAME
  String _name = '';
  String get name => _name;
  set name(String value) {
    _name = value;
  }
  // COUNTRY
  String _country = '';
  String get country => _country;
  set country(String value) {
    _country = value;
  }
  // CITY
  String _city = '';
  String get city => _city;
  set city(String value) {
    _city = value;
  }
  // MAIL
  List<String> _mail = [];
  List<String> get mail => _mail;
  set mail(List<String> value) {
    _mail = value;
  }
  // NEWSPAPER
  List<String> _newspapers = [];
  List<String> get newspapers => _newspapers;
  set newspapers(List<String> value) {
    _newspapers = value;
  }
  // PHONE NUMBER
  List<num> _phoneNumber = [];
  List<num> get phoneNumber => _phoneNumber;
  set phoneNumber(List<num> value) {
    _phoneNumber = value;
  } //firebase firestore reference

  static final String REF_FIREBASE_FIRESTORE = 'Company';

  NewspaperCompany();

  Map<String, dynamic> toJson() => _$NewspaperCompanyToJson(this);

  /// create Company from map data usually from firebase
  factory NewspaperCompany.fromJson(Map<String, dynamic> json) => _$NewspaperCompanyFromJson(json);

}
import 'package:json_annotation/json_annotation.dart';
import 'package:toxnews/app/Relation_manager.dart';

import 'app_enums.dart';

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
  /// ROOF
  final int roof = 2^CompanyState.values.length;



  //firebase firestore reference
  static const String REF_FIREBASE_FIRESTORE = 'Company';

  NewspaperCompany();

  /// COMPANIES **STATE** {like, trend, comment, follow, subscribe}

  bool isCommented() => RelationManager.decodeLevel(level, roof~/2, CompanyState.comment.index);
  void comment() {
    if(isCommented()){
      level-=roof~/(2*2^CompanyState.comment.index);
    } else{
      level+=roof~/(2*2^CompanyState.comment.index);
    }
  }

  bool isLiked() => RelationManager.decodeLevel(level, roof~/2, CompanyState.like.index);
  void like() {
    if(isLiked()){
      level-=roof~/(2*2^CompanyState.like.index);
    } else{
      level+=roof~/(2*2^CompanyState.like.index);
    }
  }
  bool hadTrend() => RelationManager.decodeLevel(level, roof~/2, CompanyState.trend.index);
  void trend() {
    if(!hadTrend()){
      level+=roof~/(2*2^CompanyState.trend.index);
    }
  }
  bool isFollowed() => RelationManager.decodeLevel(level, roof~/2, CompanyState.follow.index);
  void follow() {
    if(!isFollowed()){
      level-=roof~/(2*2^CompanyState.follow.index);
    } else{
      level+=roof~/(2*2^CompanyState.follow.index);
    }
  }
  bool isSubscribed() => RelationManager.decodeLevel(level, roof~/2, CompanyState.subscribe.index);
  void subscribe() {
    if(!isSubscribed()){
      level-=roof~/(2*2^CompanyState.subscribe.index);
    } else{
      level+=roof~/(2*2^CompanyState.subscribe.index);
    }
  }

  Map<String, dynamic> toJson() => _$NewspaperCompanyToJson(this);

  /// create Company from map data usually from firebase
  factory NewspaperCompany.fromJson(Map<String, dynamic> json) => _$NewspaperCompanyFromJson(json);

}
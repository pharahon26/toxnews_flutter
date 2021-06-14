import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:toxnews/app/Relation_manager.dart';
import 'package:toxnews/models/app_enums.dart';
import 'package:toxnews/ui/widgets/FlashNewsViews/flash_news_card_view.dart';

part 'FlashNews.g.dart';

@JsonSerializable()
class FlashNews {
  /// id
  String id = '';
  /// title
  String title = '';
  /// news
  String news = '';
  /// link
  String link = '';
  /// media link
  String mediaLink = '';
  /// the company id
  String company = '';
  /// the company logo
  String companyLogoURL = '';
  /// category
  String category = '';
  /// date of publication
  int creationDate = 0;
  /// LIKES
  int likes = 0;
  /// UNLIKES
  int unlikes = 0;
  /// TRENDS
  int trends = 0;
  /// WATCHER
  int watcher = 0;
  /// COMMENTS
  List<String> comments = [];
  /// LEVEL
  int level = 0;
  /// Roof
  final int roof = 2^FlashNewsState.values.length;

  static const String REF_FIREBASE_FIRESTORE = 'FlashNews';


  FlashNews();

  /// FLASHNEWS **STATE** {like, unlike, trend, comment, watch}

  bool isWatching() => RelationManager.decodeLevel(level, roof~/2, FlashNewsState.watch.index);
  void watch() {
    if(isWatching()){
      level-=roof~/(2*2^FlashNewsState.watch.index);
    } else{
      level+=roof~/(2*2^FlashNewsState.watch.index);
    }
  }
  bool isCommented() => RelationManager.decodeLevel(level, roof~/2, FlashNewsState.comment.index);
  void comment() {
    if(isCommented()){
      level-=roof~/(2*2^FlashNewsState.comment.index);
    } else{
      level+=roof~/(2*2^FlashNewsState.comment.index);
    }
  }

  bool isUnliked() => RelationManager.decodeLevel(level, roof~/2, FlashNewsState.unlike.index);
  void unlike() {
    if(!isUnliked()){
      level+=roof~/(2*2^FlashNewsState.unlike.index);
    }
  }
  bool isLiked() => RelationManager.decodeLevel(level, roof~/2, FlashNewsState.like.index);
  void like() {
    if(isLiked()){
      level-=roof~/(2*2^FlashNewsState.like.index);
    } else{
      level+=roof~/(2*2^FlashNewsState.like.index);
    }
  }
  bool hadTrend() => RelationManager.decodeLevel(level, roof~/2, FlashNewsState.trend.index);
  void trend() {
    if(!hadTrend()){
      level+=roof~/(2*2^FlashNewsState.trend.index);
    }
  }


  FlashNews.build(this.id, this.title, this.news, this.link,
      this.mediaLink, this.company, this.creationDate);

  /// METHODS FOR FIRESTORE
  Map<String, dynamic> toJson() => _$FlashNewsToJson(this);

  /// create FlashNews from map data usually from firebase
  factory FlashNews.fromJson(Map<String, dynamic> json) => _$FlashNewsFromJson(json);

  Widget getCard(){
    return FlashNewsCardView(flashNews: this);
  }

}
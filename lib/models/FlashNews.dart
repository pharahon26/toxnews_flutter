import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
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

  static const String REF_FIREBASE_FIRESTORE = 'FlashNews';


  FlashNews();


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
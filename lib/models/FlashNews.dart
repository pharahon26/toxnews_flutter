import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:toxnews/ui/widgets/FlashNewsViews/flash_news_card_view.dart';

part 'FlashNews.g.dart';

@JsonSerializable()
class FlashNews {
  // id
  String _id;
  String get id => _id;
  set id(String value) {
    _id = value;
  }

  // title
  String _title;
  String get title => _title;
  set title(String value) {
    /// the Text containing the news title
    _title = value;
  }

  // news
  String _news;
  String get news => _news;
  set news(String value) {
    /// the Text containing the actual news
    _news = value;
  }

  // link
  String _link;
  String get link => _link;
  set link(String value) {
    /// the link to the article in the company web site
    _link = value;
  }

  // media link
  String _mediaLink;
  String get mediaLink => _mediaLink;
  set mediaLink(String value) {
    /// the link to the media that illustrate the news
    _mediaLink = value;
  }

  // the company id
  String _company;
  String get company => _company;
  set company(String value) {
    /// company id
    _company = value;
  }

  // category
  String _category;
  String get category => _category;
  set category(String value) {
    /// company id
    _category = value;
  }

  // date of publication
  int _creationDate;
  int get creationDate => _creationDate;
  set creationDate(int value) {
    _creationDate = value;
  }

  static final String REF_FIREBASE_FIRESTORE = 'FlashNews';


  FlashNews();


  FlashNews.build(this._id, this._title, this._news, this._link,
      this._mediaLink, this._company, this._creationDate);

  /// METHODS FOR FIRESTORE
  Map<String, dynamic> toJson() => _$FlashNewsToJson(this);

  /// create FlashNews from map data usually from firebase
  factory FlashNews.fromJson(Map<String, dynamic> json) => _$FlashNewsFromJson(json);

  Widget getCard(){
    return FlashNewsCardView(flashNews: this);
  }

}
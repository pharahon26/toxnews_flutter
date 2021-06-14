import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:toxnews/app/Relation_manager.dart';
import 'package:toxnews/ui/widgets/newspaper/newspaper_card_view.dart';

import 'app_enums.dart';

part 'Newspaper.g.dart';

@JsonSerializable()
class Newspaper {

  /// id
  String id = '';
  /// title
  String titles = '';
  /// pdf url
  String pdfURL = '';
  /// link
  String country = '';
  /// media link
  String price = '';
  /// the company
  String newsPaperCompany = '';
  /// the company logo
  String firstPageURL = '';
  /// category
  String category = '';
  /// date of publication
  String date = ' ';
  /// COMMENTS
  List<String> comments = [];
  /// LIKES
  int likes = 0;
  /// UNLIKES
  int unlikes = 0;
  /// TRENDS
  int trends = 0;
  /// OWN
  int own = 0;
  /// DOWNLOAD
  int download = 0;
  /// LEVEL
  int level = 0;
  /// ROOF
  final int roof = 2^NewspaperState.values.length;


  static const String REF_FIREBASE_FIRESTORE = 'Newspapers';


  Newspaper();

  /// NEWSPAPER **STATE** {onw, download, like, unlike, trend, comment}

  bool isOwn() => RelationManager.decodeLevel(level, roof~/2, NewspaperState.own.index);
  void pushOwn() {
    if(!isOwn()){
      level+=roof~/(2*2^NewspaperState.own.index);
    }
  }
  bool isCommented() => RelationManager.decodeLevel(level, roof~/2, NewspaperState.comment.index);
  void comment() {
    if(isCommented()){
      level-=roof~/(2*2^NewspaperState.comment.index);
    } else{
      level+=roof~/(2*2^NewspaperState.comment.index);
    }
  }

  bool isUnliked() => RelationManager.decodeLevel(level, roof~/2, NewspaperState.unlike.index);
  void unlike() {
    if(!isUnliked()){
      level+=roof~/(2*2^NewspaperState.unlike.index);
    }
  }
  bool isLiked() => RelationManager.decodeLevel(level, roof~/2, NewspaperState.like.index);
  void like() {
    if(isLiked()){
      level-=roof~/(2*2^NewspaperState.like.index);
    } else{
      level+=roof~/(2*2^NewspaperState.like.index);
    }
  }
  bool hadTrend() => RelationManager.decodeLevel(level, roof~/2, NewspaperState.trend.index);
  void trend() {
    if(!hadTrend()){
      level+=roof~/(2*2^NewspaperState.trend.index);
    }
  }
  bool isDownloaded() => RelationManager.decodeLevel(level, roof~/2, NewspaperState.download.index);
  void pushDownload() {
    if(!isDownloaded()){
      level-=roof~/(2*2^NewspaperState.download.index);
    } else{
      level+=roof~/(2*2^NewspaperState.download.index);
    }
  }


  Newspaper.build(this.id, this.pdfURL, this.country,
      this.price, this.newsPaperCompany, this.date);

  /// METHODS FOR FIRESTORE
  Map<String, dynamic> toJson() => _$NewspaperToJson(this);

  /// create FlashNews from map data usually from firebase
  factory Newspaper.fromJson(Map<String, dynamic> json) => _$NewspaperFromJson(json);

  Widget getCard(){
    return NewspaperCardView(newspaper: this);
  }

}
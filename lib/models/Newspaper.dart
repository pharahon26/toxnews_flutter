import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:toxnews/ui/widgets/newspaper/newspaper_card_view.dart';

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

  static const String REF_FIREBASE_FIRESTORE = 'Newspapers';


  Newspaper();


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
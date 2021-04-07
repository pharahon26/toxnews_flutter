import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:toxnews/ui/widgets/newspaper/newspaper_card_view.dart';

part 'Newspaper.g.dart';

@JsonSerializable()
class Newspaper {

  // id
  String _id = '';
  String get id => _id;
  set id(String value) {
    _id = value;
  }

  // title
  String _titles = '';
  String get titles => _titles;
  set titles(String value) {
    /// the Text containing the news title
    _titles = value;
  }

  // pdf url
  String _pdfURL = '';
  String get pdfURL => _pdfURL;
  set pdfURL(String value) {
    /// the Text containing the actual news
    _pdfURL = value;
  }

  // link
  String _country = '';
  String get country => _country;
  set country(String value) {
    /// the link to the article in the company web site
    _country = value;
  }

  // media link
  String _price = '';
  String get price => _price;
  set price(String value) {
    /// the link to the media that illustrate the news
    _price = value;
  }

  // the company
  String _newsPaperCompany = '';
  String get newsPaperCompany => _newsPaperCompany;
  set newsPaperCompany(String value) {
    /// company id
    _newsPaperCompany = value;
  }

  // the company logo
  String _firstPageURL = '';
  String get firstPageURL => _firstPageURL;
  set firstPageURL(String value) {
    /// company id
    _firstPageURL = value;
  }


  // category
  String _category = '';
  String get category => _category;
  set category(String value) {
    /// company id
    _category = value;
  }

  // date of publication
  String _date = ' ';
  String get date => _date;
  set date(String value) {
    _date = value;
  }

  static final String REF_FIREBASE_FIRESTORE = 'Newspapers';


  Newspaper();


  Newspaper.build(this._id, this._pdfURL, this._country,
      this._price, this._newsPaperCompany, this._date);

  /// METHODS FOR FIRESTORE
  Map<String, dynamic> toJson() => _$NewspaperToJson(this);

  /// create FlashNews from map data usually from firebase
  factory Newspaper.fromJson(Map<String, dynamic> json) => _$NewspaperFromJson(json);

  Widget getCard(){
    return NewspaperCardView(newspaper: this);
  }

}
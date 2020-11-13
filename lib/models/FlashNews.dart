import 'package:flutter/material.dart';

class FlashNews {
  String _id;
  String _news;
  String _link;
  String _mediaLink;
  String _company;
  static final String REF_FIREBASE_FIRESTORE = 'FlashNews';


  FlashNews();

  Widget getCard(){
    return Text('Flash News');
  }

}
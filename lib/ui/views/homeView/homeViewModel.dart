
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:toxnews/models/FlashNews.dart';
import 'package:toxnews/services/FirebaseFirestoreService.dart';
import 'package:toxnews/tools/locator.dart';

class HomeViewModel extends BaseViewModel{
  FirebaseFirestoreService _firestoreService = locator<FirebaseFirestoreService>();
  StreamController _list = StreamController<List<FlashNews>>();


  Stream get list => _list.stream;
  List<FlashNews> _news = List();
  List<FlashNews> get news => _news;

  HomeViewModel(){
    _list.sink.add(_news);
    setNews();
  }

  void setNews() async {
    _news = await _firestoreService.getFlashNews();
    _list.sink.add(_news);
  }
}
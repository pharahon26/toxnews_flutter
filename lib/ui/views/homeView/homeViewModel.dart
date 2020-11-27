
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toxnews/models/FlashNews.dart';
import 'package:toxnews/services/FirebaseFirestoreService.dart';
import 'package:toxnews/tools/locator.dart';

class HomeViewModel extends BaseViewModel{
  FirebaseFirestoreService _firestoreService = locator<FirebaseFirestoreService>();
  StreamController _list = StreamController<List<FlashNews>>();
  List<DropdownMenuItem<String>> companies = List();
  List<DropdownMenuItem<String>> categories = List();
  String selectedCompany = 'all';
  String selectedCategory = 'all';
  bool onSort = false;


  Stream get list => _list.stream;
  List<FlashNews> _news = List();
  List<FlashNews> get news => _news;

  HomeViewModel(){
    _list.sink.add(_news);
    DropdownMenuItem<String> allSources = DropdownMenuItem(child: Text('Company',
      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white)
    ), value: 'all',);
    DropdownMenuItem<String> allCategories = DropdownMenuItem(child: Text('Subject',
      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white)
    ), value: 'all',);

    companies.add(allSources);
    categories.add(allCategories);
    setNews();
  }

  void setNews() async {
    _news = await _firestoreService.getFlashNews();
    await getDropdownMenuItems();
    _list.sink.add(_news);
  }

  void sort() async {
    List<FlashNews> temp = List();
    if(selectedCompany != 'all'){
      temp = await _firestoreService.getCompanyFlashNews(selectedCompany);
    }
    else {
      temp = await _firestoreService.getFlashNews();
    }
    if(selectedCategory != 'all'){
      List<FlashNews> result = List();
      temp.forEach((element) {
        if(element.category == selectedCategory){
          result.add(element);
        }
      });
      _list.sink.add(result);
    }
    else {
      _list.sink.add(temp);
    }
    onSort = false;
    notifyListeners();
  }

  Future getDropdownMenuItems() async {
    Set<String> company = Set();
    Set<String> category = Set();
    _news.forEach((element) {
      company.add(element.company);
      category.add(element.category);
    });
    company.forEach((element) {
      String name = element.split('.').first;
      companies.add(DropdownMenuItem(child: Text(name,
          style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.white)
      ), value: element,));
    });
    category.forEach((element) {
      categories.add(DropdownMenuItem(child: Text(element,
          style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.white)
      ), value: element,));
    });
    notifyListeners();
  }
}

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
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
  List<String> companiesList = List();
  List<String> categoriesList = List();
  String dateString = 'Last';
  DateTime date = DateTime.now();
  String selectedCompany = 'Source';
  String selectedCategory = 'Topic';


  Stream get list => _list.stream;
  List<FlashNews> _news = List();
  List<FlashNews> get news => _news;

  HomeViewModel(){
    _list.sink.add(_news);
    // DropdownMenuItem<String> allSources = DropdownMenuItem(child: Text('Magazine',
    //   style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black)
    // ), value: 'all',);
    // DropdownMenuItem<String> allCategories = DropdownMenuItem(child: Text('Topic',
    //   style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black)
    // ), value: 'all',);
    companiesList.add('Source');
    categoriesList.add('Topic');
    // companies.add(allSources);
    // categories.add(allCategories);
    setNews();
  }

  void setNews() async {
    _news = await _firestoreService.getFlashNews();
    await getDropdownMenuItems();
    _list.sink.add(_news);
  }

  Future<List<FlashNews>> _sortByCompany() async {
    List<FlashNews> result = [];
    if(selectedCompany != 'Source' ){
      result = await _firestoreService.getCompanyFlashNews(selectedCompany);
    }
    else {
      result = await _firestoreService.getFlashNews();
    }
    return result;
  }

  Future<List<FlashNews>> _sortByDate(List<FlashNews> list) async {
    List<FlashNews> result = [];
    DateTime now = DateTime.now();
    if(date.day == now.day && date.month == now.month && date.year == now.year){
      list.forEach((element) {result.add(element);});
      dateString = 'Last';
      print('Last Day');
    }
    else {
      print('not Last Day');
      list.forEach((element) {
        DateTime t = DateTime.fromMillisecondsSinceEpoch(element.creationDate);
        if (date.day == t.day && date.month == t.month && date.year == t.year) {
          print('Match Day');
          result.add(element);
        }
      });
    }
    return result;
  }

  Future<List<FlashNews>> _sortByCategory(List<FlashNews> list) async {
    List<FlashNews> result = [];
    if( selectedCompany != 'Topic' ){
      list.forEach((element) {
        if(element.category == selectedCategory){
          result.add(element);
        }
      });
    }
    else {
      list.forEach((element) {result.add(element);});
    }
    return result;
  }


  sort() async {
    /// Mag sort
    List<FlashNews> temp = await _sortByCompany();
    /// Date Sort
    // List<FlashNews> temp1 = await _sortByDate(temp);
    /// category sort
    List<FlashNews> temp2 = await _sortByCategory(temp);
    _list.sink.add(temp2);
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
      companiesList.add(name);
      // companies.add(DropdownMenuItem(child: Text(name,
      //     style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.black)
      // ), value: element,));
    });
    category.forEach((element) {
      categoriesList.add(element);
      // categories.add(DropdownMenuItem(child: Text(element,
      //     style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.black)
      // ), value: element,));
    });
    notifyListeners();
  }
}
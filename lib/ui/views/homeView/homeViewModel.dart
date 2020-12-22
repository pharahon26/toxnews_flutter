
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:toxnews/models/FlashNews.dart';
import 'package:toxnews/services/FirebaseFirestoreService.dart';
import 'package:toxnews/tools/locator.dart';
import 'package:toxnews/tools/router.gr.dart';

class HomeViewModel extends BaseViewModel{
  FirebaseFirestoreService _firestoreService = locator<FirebaseFirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();
  StreamController _list = StreamController<List<FlashNews>>();
  List<DropdownMenuItem<String>> companies = List();
  List<DropdownMenuItem<String>> categories = List();
  List<String> companiesList = List();
  Map<String, String> companiesMap = Map();
  List<String> categoriesList = List();
  String dateString = 'Last News';
  String defaultString = 'Last News';
  String local = 'fr';
  DateTime date = DateTime.now();
  String selectedCompany = 'Source';
  String selectedCategory = 'Topic';
  String defaultCompany = 'Source';
  String defaultCategory = 'Topic';


  Stream get list => _list.stream;
  List<FlashNews> _news = List();
  List<FlashNews> get news => _news;

  HomeViewModel(){
    if(local == 'en'){
      dateString = 'Last News';
      selectedCompany = 'Source';
      selectedCategory = 'Topic';
      defaultString = 'Last News';
      defaultCompany = 'Source';
      defaultCategory = 'Topic';
    }else if(local == 'fr'){
      dateString = 'Dernières Infos';
      selectedCompany = 'Source';
      selectedCategory = 'Sujets';
      defaultString = 'Dernières Infos';
      defaultCompany = 'Source';
      defaultCategory = 'Sujets';
    }
    _list.sink.add(_news);
    // DropdownMenuItem<String> allSources = DropdownMenuItem(child: Text('Magazine',
    //   style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black)
    // ), value: 'all',);
    // DropdownMenuItem<String> allCategories = DropdownMenuItem(child: Text('Topic',
    //   style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black)
    // ), value: 'all',);
    companiesList.add(defaultCompany);
    categoriesList.add(defaultCategory);
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
    if(selectedCompany != defaultCompany ){
      result = await _firestoreService.getCompanyFlashNews(companiesMap[selectedCompany]);
    }
    else {
      result = await _firestoreService.getFlashNews();
    }
    return result;
  }

  Future<List<FlashNews>> _sortByDate(List<FlashNews> list) async {
    List<FlashNews> result = [];
    DateTime now = DateTime.now();
    if(now.difference(date) < Duration(days: 1)){
      list.forEach((element) {
        result.add(element);
      });
      dateString = defaultString;
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
    if( selectedCategory != defaultCategory ){
      list.forEach((element) {
        if(element.category == selectedCategory){
          result.add(element);
        }
      });
    }
    else {
      list.forEach((element) {
        result.add(element);
      });
    }
    return result;
  }

  navigateToAbout(){
    _navigationService.navigateTo(Routes.about);
  }


  sort() async {
    /// Mag sort
    List<FlashNews> temp = await _sortByCompany();
    /// Date Sort
    List<FlashNews> temp1 = await _sortByDate(temp);
    /// category sort
    List<FlashNews> temp2 = await _sortByCategory(temp1);
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
      companiesMap[element.split('.').first] = element;
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
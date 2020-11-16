
import 'package:stacked/stacked.dart';
import 'package:toxnews/models/FlashNews.dart';
import 'package:toxnews/services/FirebaseFirestoreService.dart';
import 'package:toxnews/tools/locator.dart';

class HomeViewModel extends BaseViewModel{
  FirebaseFirestoreService _firestoreService = locator<FirebaseFirestoreService>();

  List<FlashNews> _news = List();
  List<FlashNews> get news => _news;

  HomeViewModel(){
    setNews();
  }

  void setNews() async {
    _news = await _firestoreService.getFlashNews();
  }
}
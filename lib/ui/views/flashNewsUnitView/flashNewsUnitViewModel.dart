
import 'package:stacked/stacked.dart';
import 'package:toxnews/models/FlashNews.dart';
import 'package:toxnews/services/FirebaseFirestoreService.dart';
import 'package:toxnews/tools/locator.dart';

class FlashNewsUnitViewModel extends BaseViewModel{
  FlashNews news;

  FlashNewsUnitViewModel({this.news});

  void reachBase() {
    /// open the link to the Article web site
  }
}
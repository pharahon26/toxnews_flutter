
import 'package:stacked/stacked.dart';
import 'package:toxnews/models/FlashNews.dart';
import 'package:url_launcher/url_launcher.dart';

class FlashNewsUnitViewModel extends BaseViewModel{
  FlashNews news;

  FlashNewsUnitViewModel({required this.news});

  void reachBase() async {
    /// open the link to the Article web site
    if (await canLaunch(news.link)) {
    await launch(news.link);
    } else {
    throw 'Could not launch ${news.link}';
    }
  }
}
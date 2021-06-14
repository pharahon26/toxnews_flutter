
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:toxnews/app/app.locator.dart';
import 'package:toxnews/app/app.router.dart';
import 'package:toxnews/models/FlashNews.dart';
import 'package:url_launcher/url_launcher.dart';

class FlashNewsUnitViewModel extends BaseViewModel{
  FlashNews news;
  final NavigationService _navigationService = locator<NavigationService>();

  FlashNewsUnitViewModel({required this.news});

  void navigateToCompany(){
    print('Navigate to Company : ${news.company}}');
    _navigationService.navigateTo(Routes.companyUnitView, arguments: CompanyUnitViewArguments(companyId: news.company));
    dispose();
  }

  void reachBase() async {
    /// open the link to the Article web site
    if (await canLaunch(news.link)) {
    await launch(news.link);
    } else {
    throw 'Could not launch ${news.link}';
    }
  }
}
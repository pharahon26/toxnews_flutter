
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:toxnews/app/app.locator.dart';
import 'package:toxnews/app/app.router.dart';
import 'package:toxnews/models/FlashNews.dart';
import 'package:toxnews/models/Newspaper.dart';
import 'package:toxnews/services/NewspaperRepository.dart';

class FlashNewsCardViewModel extends BaseViewModel{
  bool isDownloading = false;
  FlashNews flashNews;
  final NavigationService _navigationService = locator<NavigationService>();


  FlashNewsCardViewModel(this.flashNews);

  void navigateToArticle(){
    _navigationService.navigateTo(Routes.flashNewsUnitView, arguments: FlashNewsUnitViewArguments(news: flashNews));
  }

  void navigateToCompany(String companyId){
    print('Navigate to Company : $companyId}');
    _navigationService.navigateTo(Routes.companyUnitView, arguments: CompanyUnitViewArguments(companyId: companyId));
  }

  void like(){
    print('Like FlashNews : ${flashNews.id}}');

  }
  void unlike(){
    print('Unlike FlashNews : ${flashNews.id}}');
  }
  void trend(){
    print('trend FlashNews : ${flashNews.id}}');
  }
  void watch(){
    print('watch FlashNews : ${flashNews.id}}');
  }
  void comment(String comment){
    print('comment $comment \n on FlashNews : ${flashNews.id}}');
  }

}
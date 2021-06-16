
import 'package:stacked/stacked.dart';
import 'package:toxnews/app/app.locator.dart';
import 'package:toxnews/models/FlashNews.dart';
import 'package:toxnews/models/Newspaper.dart';
import 'package:toxnews/models/NewspaperCompany.dart';
import 'package:toxnews/services/FirebaseFirestoreService.dart';


class CompanyUnitViewModel extends BaseViewModel{
  String companyId;
  bool wait = true;
  late Future<NewspaperCompany> company;
  final FirebaseFirestoreService _firestoreService = locator<FirebaseFirestoreService>();

  CompanyUnitViewModel(this.companyId){
    company = _firestoreService.getCompany(companyId);
  }

  Future<List<FlashNews>> getFlashNews(){
    return _firestoreService.getCompanyFlashNews(companyId);
  }
  Future<List<Newspaper>> getNewspapers(){
    return _firestoreService.getCompanynewspapers(companyId);
  }


}
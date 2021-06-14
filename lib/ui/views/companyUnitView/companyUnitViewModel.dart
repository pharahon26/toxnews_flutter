
import 'package:stacked/stacked.dart';
import 'package:toxnews/app/app.locator.dart';
import 'package:toxnews/models/NewspaperCompany.dart';
import 'package:toxnews/services/FirebaseFirestoreService.dart';


class CompanyUnitViewModel extends BaseViewModel{
  String companyId;
  late NewspaperCompany company;
  final FirebaseFirestoreService _firestoreService = locator<FirebaseFirestoreService>();

  CompanyUnitViewModel(this.companyId){
   company = _firestoreService.getCompany(companyId);
  }

}
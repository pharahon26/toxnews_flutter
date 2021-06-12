import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:toxnews/app/app.locator.dart';
import 'package:toxnews/app/app.router.dart';
import 'package:toxnews/models/ToxNewsUsers.dart';
import 'package:toxnews/services/FirebaseFirestoreService.dart';


class ProfileViewModel extends BaseViewModel{
  FirebaseFirestoreService _firestoreService = locator<FirebaseFirestoreService>();
  NavigationService _navigationService = locator<NavigationService>();

  late ToxNewsUsers user;


  ProfileViewModel(){
    user = _firestoreService.user;
  }

  void changeName(String newName) {}
  void changeMail(String newMail) {}
  void changePhone(String newPhone) {}

  navigateToAbout(){
    _navigationService.navigateTo(Routes.about);
  }

  navigateToFlashNews(){
    _navigationService.navigateTo(Routes.personalFlashNewsView);
  }

  navigateToNewspapers(){
    _navigationService.navigateTo(Routes.personalNewspaperView);
  }

  navigateToCompanies(){
    _navigationService.navigateTo(Routes.personalCompanyView);
  }



}
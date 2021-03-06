import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:toxnews/services/FirebaseAuhService.dart';
import 'package:toxnews/services/FirebaseFirestoreService.dart';
import 'package:toxnews/services/NewspaperRepository.dart';
import 'package:toxnews/ui/views/aboutView/about.dart';
import 'package:toxnews/ui/views/companyUnitView/companyUnitView.dart';
import 'package:toxnews/ui/views/flashNewsUnitView/flashNewsUnitView.dart';
import 'package:toxnews/ui/views/homeView/home.dart';
import 'package:toxnews/ui/views/logInView/logIn.dart';
import 'package:toxnews/ui/views/newspaperUnitView/newspaperUnitView.dart';
import 'package:toxnews/ui/views/newspaperViewer/newspaperViewer.dart';
import 'package:toxnews/ui/views/personalCompanyView/personalCompanyView.dart';
import 'package:toxnews/ui/views/personalFlashNewsView/personalFlashNewsView.dart';
import 'package:toxnews/ui/views/personalNewspaperView/personalNewspaperView.dart';
import 'package:toxnews/ui/views/profileView/profile.dart';
import 'package:toxnews/ui/views/signUpView/signUp.dart';
import 'package:toxnews/ui/views/splashSreenView/splash_screen.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: LogIn),
    MaterialRoute(page: SignUp),
    MaterialRoute(page: Home),
    MaterialRoute(page: NewspaperUnitView),
    MaterialRoute(page: FlashNewsUnitView),
    MaterialRoute(page: NewspaperViewer),
    MaterialRoute(page: CompanyUnitView),
    MaterialRoute(page: PersonalNewspaperView),
    MaterialRoute(page: PersonalFlashNewsView),
    MaterialRoute(page: PersonalCompanyView),
    MaterialRoute(page: About),
    MaterialRoute(page: ProfileView)
  ],
    dependencies: [
        LazySingleton(classType: NavigationService),
        LazySingleton(classType: SnackbarService),
        LazySingleton(classType: FirebaseAuthService),
        LazySingleton(classType: FirebaseFirestoreService),
        LazySingleton(classType: NewspaperRepository),
    ],
)
class AppSetup {
}
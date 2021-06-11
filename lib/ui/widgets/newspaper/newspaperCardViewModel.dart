
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:toxnews/app/app.locator.dart';
import 'package:toxnews/app/app.router.dart';
import 'package:toxnews/models/Newspaper.dart';
import 'package:toxnews/services/NewspaperRepository.dart';

class NewspaperCardViewModel extends BaseViewModel{
  bool isDownloading = false;
  final NewspaperRepository _newspaperRepository = locator<NewspaperRepository>();
  final NavigationService _navigationService = locator<NavigationService>();


  Future<String> downloadPdfAndNavigate( Newspaper newspaper) async {
      isDownloading = true;
      String path = await _newspaperRepository.downloadNewspaper(newspaper);
      isDownloading = false;
    return path;
  }

  void navigateToReader(String path){
    _navigationService.navigateTo(Routes.newspaperViewer, arguments: NewspaperViewerArguments(path: path));
    dispose();
  }

  void navigateToDetails(Newspaper newspaper){
    _navigationService.navigateTo(Routes.newspaperUnitView, arguments: NewspaperUnitViewArguments(newspaper: newspaper));
    dispose();
  }

}
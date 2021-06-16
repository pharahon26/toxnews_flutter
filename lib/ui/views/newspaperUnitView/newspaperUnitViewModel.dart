
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:toxnews/app/app.locator.dart';
import 'package:toxnews/app/app.router.dart';
import 'package:toxnews/models/Newspaper.dart';
import 'package:toxnews/services/NewspaperRepository.dart';


class NewspaperUnitViewModel extends BaseViewModel{
  Newspaper newspaper;
  late DateTime date;
  bool isDownloading = false;
  final NewspaperRepository _newspaperRepository = locator<NewspaperRepository>();
  final NavigationService _navigationService = locator<NavigationService>();

  NewspaperUnitViewModel(this.newspaper){
    List<String> d = newspaper.date.split('.');
    int day = int.parse(d[0]);
    int month = int.parse(d[1]);
    int year = int.parse(d[2]);
    date = DateTime(year, month, day);
  }



  Future<String> downloadPdfAndNavigate() async {
    isDownloading = true;
    String path = await _newspaperRepository.downloadNewspaper(newspaper);
    isDownloading = false;
    return path;
  }

  void navigateToReader(String path){
    _navigationService.navigateTo(Routes.newspaperViewer, arguments: NewspaperViewerArguments(path: path));
    dispose();
  }
}
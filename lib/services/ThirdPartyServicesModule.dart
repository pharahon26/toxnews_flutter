


import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class ThirdPartyServicesModule{
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
  @lazySingleton
  SnackbarService get snackbarService;
  // the database managers will be stored here as well

}
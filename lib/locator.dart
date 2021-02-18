import 'package:rollanddice/services/dialog_service.dart';
import 'package:rollanddice/services/localization_service.dart';
import 'package:rollanddice/services/navigation_service.dart';
import 'package:get_it/get_it.dart';
export 'package:rollanddice/services/dialog_service.dart';
export 'package:rollanddice/services/localization_service.dart';
export 'package:rollanddice/services/navigation_service.dart';
export 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => LocalizationService());

}

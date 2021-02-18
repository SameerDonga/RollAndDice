import 'dart:async';

import 'package:rollanddice/locator.dart';
import 'package:rollanddice/models/localization_language_model.dart';
import 'package:rollanddice/constants/languages.dart';
import 'package:rollanddice/services/dialog_service.dart';

class LocalizationService {
  final DialogService _dialogService = locator<DialogService>();

  StreamController languageChangeNotifier = StreamController.broadcast();

  Map<String, LocalizationLanguage> _languages = {
    'EN': LocalizationLanguage(name: 'English', flagId: 'GB', shortName: 'EN'),
    'SW': LocalizationLanguage(name: 'Swahili', flagId: 'KE', shortName: 'SW')
  };

  Map<String, Map<String, String>> _languageValues = {
    'EN': English,
    'SW': Swahili
  };

  String _selectedLanguage = 'EN';
  String get selectedLanguage => _selectedLanguage;

  LocalizationLanguage get currentLanguage => _languages[_selectedLanguage];
  List<LocalizationLanguage> get languages => _languages.values.toList();

  setLanguage(String id) {
    if (id != _selectedLanguage) {
      _selectedLanguage = id;
      languageChangeNotifier.sink.add(true);
    }
    _dialogService.changeLanguageComplete(true);

    print('Language Set : $_selectedLanguage');
  }

  String getValueById(String id) {
    if( _languageValues[_selectedLanguage][id]==null)
      return id;
    return _languageValues[_selectedLanguage][id];
  }

  
}

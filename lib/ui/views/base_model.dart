import 'dart:async';
import 'package:rollanddice/locator.dart';
import 'package:rollanddice/ui/shared/app_colors.dart';
import 'package:rollanddice/models/localization_language_model.dart';
import 'package:rollanddice/services/dialog_service.dart';
import 'package:rollanddice/services/localization_service.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
export 'package:provider_architecture/provider_architecture.dart';

enum ViewState { Idle, Busy }

String userChatID;

class BaseModel extends ChangeNotifier {
  final LocalizationService _localizationService =
      locator<LocalizationService>();
  final DialogService _dialogService = locator<DialogService>();

//  static const String  userChatID='' ;
  String ShareURL;
  Uri finalURL;
  final NavigationService _navigationService = locator<NavigationService>();
  BuildContext context;
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  DialogService get dialogService => _dialogService;

  redirectToPage(String routeName, {dynamic arguments}) {
    _navigationService.navigateTo(routeName, arguments: arguments);
  }

  redirectWithClearBackStack(String routeName, {dynamic arguments}) {
    _navigationService.popAllAndNavigateTo(routeName, arguments: arguments);
  }

  Future<void> redirectToPageWithAwait(String routeName,
      {dynamic arguments}) async {
    await _navigationService.navigateTo(routeName, arguments: arguments);
    return;
  }

  redirectWithPop(String routeName, {dynamic arguments}) {
    _navigationService.navigateToAndPop(routeName, arguments: arguments);
  }



  void setState(ViewState viewState) {
    if (_state != viewState) _state = viewState;
    notifyListeners();
  }

  pop() {
    _navigationService.pop();
  }

  String translate(String wordToTranslate) {
    return _localizationService.getValueById(wordToTranslate);
  }

  showLanguagePicker() async {
    _dialogService.showLanguagePicker();
  }

  LocalizationLanguage get currentLanguage =>
      _localizationService.currentLanguage;

  List<LocalizationLanguage> get getAllLanguages =>
      _localizationService.languages;

  bool _busy = false;

  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  void setLanguage(LocalizationLanguage value) {
//    _busy = value;
//    notifyListeners();
  }

  @override
  Future<void> dispose() async {
//    await _streamSubscriptionLanguageChange.cancel();
//    super.dispose();
  }

  void showMessageInFlushBar(String message, bool isError) {
    try {
      if (message != null) {
        Flushbar(
          message: message,
          flushbarStyle: FlushbarStyle.GROUNDED,
          flushbarPosition: FlushbarPosition.TOP,
          duration: Duration(seconds: 4),
          backgroundColor: isError
              ? AppColors.plRedColor
              : AppColors.disabledButtonBackgroundColor,
        ).show(context);
      }
    } catch (e) {
      print(e);
    }
  }

  void showMessageInFlushBarWithContext(
      String message, bool isError, BuildContext context) {
    try {
      if (message != null) {
        Flushbar(
          message: message,
          flushbarStyle: FlushbarStyle.GROUNDED,
          flushbarPosition: FlushbarPosition.TOP,
          duration: Duration(seconds: 4),
          backgroundColor:
              isError ? Colors.red : AppColors.enabledButtonBackgroundColor,
        ).show(context);
      }
    } catch (e) {
      print(e);
    }
  }



 }

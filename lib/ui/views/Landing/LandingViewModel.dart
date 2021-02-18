import 'dart:io';

import 'package:rollanddice/utils.dart';
import 'package:rollanddice/ui/views/base_model.dart';
import 'package:flutter/material.dart';
import 'package:rollanddice/services/dialog_service.dart';
import 'package:rollanddice/locator.dart';
class LandingViewModel extends BaseModel{
  LandingViewModel(BuildContext buildContext){
    context = buildContext;
  }
  final DialogService _dialogService = locator<DialogService>();
  Future<bool> closeAppConfirmation() async {
    var response = await _dialogService.showConfirmationDialog(
        cancelTitle: 'No',
        confirmationTitle: 'Yes',
        title: 'Logout',
        description: 'Are you sure you want to logout?');
    return response.confirmed;
  }
  String apiVersion = '';

  void getAPIVersion() async {
    if (Platform.isIOS) {
      try {
        apiVersion = await Utility.projectVersion;
      } catch(e){
        showMessageInFlushBar("Failed to get platform version.", true);
      }
    } else if (Platform.isAndroid) {
      try {
        apiVersion = await Utility.projectVersion;
      } catch(e){
        // showMessageInFlushBar("Failed to get platform version.", true);
      }
    }
    notifyListeners();
  }
}
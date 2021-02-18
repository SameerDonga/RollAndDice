import 'dart:io';

import 'package:rollanddice/utils.dart';
import 'package:flutter/material.dart';
import 'package:rollanddice/locator.dart';
import 'package:rollanddice/models/Users.dart';
import 'package:rollanddice/services/Firebase.dart';

import 'package:rollanddice/ui/views/base_model.dart';

class DrawerViewModel extends BaseModel {
  DrawerViewModel(BuildContext newContext) {
    context = newContext;
  }

  String apiVersion;
  User users;

  init() {
    FirebaseService.getUser().then((value) {
      users = User.fromMap(value.data());
      notifyListeners();
      print("user data >>>>>>>>>>> ${value.data()}");
    });
    getAPIVersion();

    notifyListeners();
  }

  void getAPIVersion() async {
    if (Platform.isIOS) {
      try {
        apiVersion = await Utility.projectVersion;
      } catch (e) {
        showMessageInFlushBar("Failed to get platform version.", true);
      }
    } else if (Platform.isAndroid) {
      try {
        apiVersion = await Utility.projectVersion;
      } catch (e) {
        showMessageInFlushBar("Failed to get platform version.", true);
      }
    }
    notifyListeners();
  }

  doSomeWork() {
    setBusy(true);

    setBusy(false);
  }

  @override
  Future<void> dispose() {
    return super.dispose();
  }
}

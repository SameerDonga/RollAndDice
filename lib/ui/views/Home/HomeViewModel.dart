import 'package:flutter/material.dart';
import 'package:rollanddice/ui/shared/app_theme.dart';
import 'package:rollanddice/ui/views/base_model.dart';
import 'package:rollanddice/services/Firebase.dart';
import 'package:rollanddice/models/Users.dart';

class HomeViewModel extends BaseModel {
  HomeViewModel(BuildContext buildContext) {
    context = buildContext;
  }

  User user;



  init() {
    FirebaseService.getUser().then((value) {
      user = User.fromMap(value.data());
    });
  }

  List<String> images = [
    AppTheme.dice1,
    AppTheme.dice2,
    AppTheme.dice3,
    AppTheme.dice4,
    AppTheme.dice5,
    AppTheme.dice6,
  ];
}

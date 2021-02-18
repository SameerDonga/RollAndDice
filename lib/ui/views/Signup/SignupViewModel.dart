import 'package:flutter/material.dart';
import 'package:rollanddice/constants/languageContstants.dart';
import 'package:rollanddice/constants/route_names.dart';
import 'package:rollanddice/models/Users.dart';
import 'package:rollanddice/utils.dart';
import 'package:rollanddice/ui/views/base_model.dart';
import 'package:rollanddice/services/Firebase.dart';
import 'package:rollanddice/ui/shared/shared_preference.dart';

class SignUpViewModel extends BaseModel {
  SignUpViewModel(BuildContext buildContext) {
    context = buildContext;
  }

  registerToFirebase({String email, String password, String fullName}) {
    Utility.isInternetAvailable().then((isConnected) async {
      if (isConnected) {
        FirebaseService.firebaseAuth.signOut();
        setState(ViewState.Busy);
        FirebaseService.firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) async {
          await UserPreference.setUserEmail(email);
          await UserPreference.setUserLogin(true);
          User user = new User(email: email,fullName: fullName,score: 0,attemptRemain: 10);
          FirebaseService.addUser(user.toMap());
          redirectWithClearBackStack(HomeViewRoute);
          setState(ViewState.Idle);
        }).catchError((onError) {
          showMessageInFlushBar("$onError", true);
          setState(ViewState.Idle);
        });
      } else {
        showMessageInFlushBar(translate(no_internet_connection), true);
        setState(ViewState.Idle);
      }
    });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:rollanddice/ui/views/base_model.dart';
import 'package:rollanddice/utils.dart';
import 'package:rollanddice/services/Firebase.dart';
import 'package:rollanddice/constants/route_names.dart';
import 'package:rollanddice/ui/shared/shared_preference.dart';
class LoginViewModel extends BaseModel{
  LoginViewModel(BuildContext buildContext){
    context = buildContext;
  }

  loginToFirebase({String email, String password}) {
    Utility.isInternetAvailable().then((isConnected) async {
      if (isConnected) {
        FirebaseService.firebaseAuth.signOut();
        setState(ViewState.Busy);
        FirebaseService.firebaseAuth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) async{
              await UserPreference.setUserEmail(email);
         await UserPreference.setUserLogin(true);
          redirectWithClearBackStack(HomeViewRoute);
          setState(ViewState.Idle);
        }).catchError((onError) {
          showMessageInFlushBar("$onError", true);
          setState(ViewState.Idle);
        });
      } else {
        showMessageInFlushBar('No Internet Connection', true);
        setState(ViewState.Idle);
      }
    });
  }
}
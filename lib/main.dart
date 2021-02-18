import 'package:rollanddice/app.dart';
import 'package:rollanddice/constants/route_names.dart';
import 'package:rollanddice/locator.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rollanddice/services/Firebase.dart';
import 'package:rollanddice/ui/shared/shared_preference.dart';
void main() async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));

  setupLocator();
  Fimber.plantTree(DebugTree());
//  checkUserLoggedinOrNot();
  Fimber.plantTree(DebugTree.elapsed());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseService().init();
  // SharedPreferences.setMockInitialValues({});

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    //DeviceOrientation.landscapeLeft,
  ]);
  checkUserLoggedInOrNot();
   // runApp(MyApp(LandingViewRoute));
}

void checkUserLoggedInOrNot() async {
  bool isLogin = await UserPreference.getUserLogin();
  if (isLogin == null) isLogin = false;

  if (isLogin == true) {
    runApp(MyApp(HomeViewRoute));
  } else {
    runApp(MyApp(LandingViewRoute));
  }
}
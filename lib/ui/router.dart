import 'package:rollanddice/constants/route_names.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rollanddice/ui/views/Home/HomeView.dart';
import 'package:rollanddice/ui/views/Landing/LandingView.dart';
import 'package:rollanddice/ui/views/Login/LoginView.dart';
import 'package:rollanddice/ui/views/Signup/SignupView.dart';
import 'package:rollanddice/ui/views/LeaderBoard/LeaderBoardView.dart';
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {

    case LandingViewRoute:
      return _getPageRoute(
          routeName: settings.name, viewToShow: LandingView());
    case LoginViewRoute:
      return _getPageRoute(
          routeName: settings.name, viewToShow: LoginView());
    case SignUpViewRoute:
      return _getPageRoute(
          routeName: settings.name, viewToShow: SignUpView());
    case HomeViewRoute:
      return _getPageRoute(
          routeName: settings.name, viewToShow: HomeView());
    case LeaderBoardViewRoute:
      return _getPageRoute(
          routeName: settings.name, viewToShow: LeaderBoardView());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  print('Navigating To $routeName');
  return PageTransition(
      type: PageTransitionType.rightToLeft, child: SafeArea(child: viewToShow));
  /*
  return MaterialPageRoute(
      settings: RouteSettings(
        arguments: args,
        name: routeName,
      ),
      builder: (_) => SafeArea(
            child: viewToShow,
            top: true,
          ));*/
}

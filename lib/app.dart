import 'package:rollanddice/locator.dart';
import 'package:rollanddice/models/GlobalProvider.dart';
import 'package:rollanddice/ui/shared/app_colors.dart';
import 'package:rollanddice/services/navigation_service.dart';
import 'package:rollanddice/ui/router.dart';
import 'package:rollanddice/ui/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'managers/dialog_manager.dart';

class MyApp extends StatelessWidget {
  final String routePath;
  MyApp(this.routePath);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GlobalProvider>(
        create: (context) => GlobalProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
//       debugShowMaterialGrid: true,
      title: 'Template App',
      builder: (context, child) => ScrollConfiguration(
        behavior: CustomScrollBehaviour(),
        child: Navigator(
          key: locator<DialogService>().dialogNavigationKey,
          onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => DialogManager(child: child)),
        ),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
        primaryColor: AppColors.plRedColor,
        backgroundColor: AppColors.backgroundColor,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: AppTheme.ffCelias,
            ),
      ),
      initialRoute: routePath,

      onGenerateRoute: generateRoute,),
    );
  }
}

class CustomScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

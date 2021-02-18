import 'package:rollanddice/constants/route_names.dart';
import 'package:rollanddice/models/dialog_models.dart';
import 'package:rollanddice/ui/shared/app_colors.dart';
import 'package:rollanddice/ui/shared/shared_preference.dart';
import 'package:rollanddice/ui/views/BaseCommonWidget.dart';
import 'package:rollanddice/ui/widgets/custom_drawer/DrawerViewModel.dart';
import 'package:rollanddice/ui/widgets/custom_drawer/custom_drawer_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'package:rollanddice/ui/shared/app_theme.dart';
import 'package:rollanddice/ui/shared/size_config.dart';
import 'package:rollanddice/services/Firebase.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> with BaseCommonWidget {
  final double leftPadding = SizeConfig.relativeWidth(4);

  final double menuItemHeight = SizeConfig.relativeHeight(5);

  @override
  void initState() {
    imageCache.clear();
    imageCache.clearLiveImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ViewModelProvider<DrawerViewModel>.withConsumer(
        viewModel: DrawerViewModel(context),
        // Consumer<AllData>(
        builder: (context, model, child) {
          return Container(
            color: AppColors.backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      left: leftPadding,
                      right: leftPadding,
                      top: SizeConfig.relativeHeight(2),
                      bottom: SizeConfig.relativeHeight(2)),
                  color: AppTheme.lighten(AppColors.plRedColor, 0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizeConfig.horizontalSpacer(2),
                      Icon(
                        Icons.account_circle_outlined,
                        color: AppColors.plRedColor,
                        size: SizeConfig.relativeSize(30),
                      ),
                      SizeConfig.horizontalSpacer(2),

                      Expanded(
                          //flex: 8,
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          model.users != null
                              ? Text(
                                  model.users.fullName,
                                  style: TextStyle(
                                    color: AppColors.plRedColor,
                                    fontSize: SizeConfig.setSp(13),
                                  ),
                                )
                              : Container(),
                          SizeConfig.verticalSpacer(1),
                          model.users != null
                              ? Container(
                                  width: SizeConfig.relativeWidth(80),
                                  child: Text(
                                    model.users.email,
                                    style: TextStyle(
                                      color: AppColors.plRedColor,
                                      fontSize: SizeConfig.setSp(13),
                                    ),
                                  ))
                              : Container(),
                        ],
                      ))
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(
                      left: leftPadding,
                      bottom: leftPadding / 2,
                    ),
                    children: <Widget>[
                      CustomDrawerMenuItem(
                        title: 'Leaderboard',
                        icon: Icons.leaderboard,
                        height: menuItemHeight,
                        onTap: () {
                          Navigator.pop(context);
                          model.redirectToPage(LeaderBoardViewRoute);
                        },
                      ),
                      CustomDrawerMenuItem(
                        title: 'Logout',
                        icon: Icons.logout,
                        height: menuItemHeight,
                        onTap: () => _logout(model),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      left: leftPadding,
                      right: leftPadding,
                      top: leftPadding / 2,
                      bottom: leftPadding / 2),
                  color: AppTheme.darken(AppColors.plRedColor, 0.05),
                  child: Text(
                    "App Version : ${model.apiVersion}",
                    style: TextStyle(
                      color: AppColors.backgroundColor,
                      fontSize: SizeConfig.setSp(14),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        onModelReady: (model) async {
          model.init();
        },
      ),
    );
  }

  _logout(DrawerViewModel model) async {
    Scaffold.of(context).openEndDrawer();

    DialogResponse close = await model.dialogService.showConfirmationDialog(
        cancelTitle: 'no',
        confirmationTitle: 'yes',
        title: 'Logout',
        description: 'Are you sure you want to logout ?');
    if (close.confirmed) {
      print("yes");
      // model.deleteUserAlbum(albumId: albumId);
      model.redirectWithClearBackStack(LandingViewRoute);
      FirebaseService.firebaseAuth.signOut();
      // await UserPreference.saveUserDetails({});
      // await UserPreference.setAllData('');
      await UserPreference.setUserLogin(false);
    } else {
      print("no");
    }
    print(close.confirmed);
  }
}

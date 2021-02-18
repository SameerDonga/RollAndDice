import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:rollanddice/generated/assets.dart';
import 'package:rollanddice/ui/shared/app_colors.dart';
import 'package:rollanddice/ui/shared/app_theme.dart';
import 'package:rollanddice/ui/views/BaseCommonWidget.dart';
import 'package:rollanddice/ui/widgets/custom_drawer/custom_drawer.dart';
import 'package:rollanddice/ui/views/Home/HomeViewModel.dart';
import 'package:rollanddice/ui/widgets/CircularButton.dart';
import 'package:rollanddice/ui/shared/size_config.dart';
import 'dart:math';
import 'package:rollanddice/services/Firebase.dart';
import 'package:rollanddice/models/Users.dart';
import 'dart:async';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with BaseCommonWidget, TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isClicked = false;
  StreamController<User> userController = StreamController<User>.broadcast();
  Random rnd = new Random();
  var isDiceRolling = false;

  int imagePosition = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    userController.close();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      SizeConfig().init(ctx, constraints);
      return ViewModelProvider<HomeViewModel>.withConsumer(
        viewModel: HomeViewModel(context),
        builder: (ct, model, child) {
          return Scaffold(
            key: _scaffoldKey,
            drawer: CustomDrawer(),
            backgroundColor: AppColors.backgroundColor,
            body: _getBody(model),
          );
        },
        onModelReady: (model) async {
          FirebaseService.getUser().then((value) {
            model.user = User.fromMap(value.data());
            userController.add(model.user);
          });
        },
      );
    });
  }

  Widget _getBody(HomeViewModel model) {
    return Stack(
      children: <Widget>[
        ///Main Body
        _getBaseContainer(model),

        ///Progress Indicator
        getProgressBar(model.state),
      ],
    );
  }

  _getBaseContainer(HomeViewModel model) {
    return StreamBuilder(
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          model.user = snapshot.data;
        }
        return model.user != null
            ? Container(
                width: double.infinity,
                height: SizeConfig.relativeHeight(100),
                padding: AppTheme.getContentPadding(bottom: 2.5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => _scaffoldKey.currentState.openDrawer(),
                          child: Icon(Icons.menu),
                        ),
                        Container(
                          width: SizeConfig.relativeHeight(10),
                          // height: SizeConfig.relativeHeight(5),
                          padding: EdgeInsets.all(
                            SizeConfig.relativeSize(3),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.greenColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Score ",
                                  style: TextStyle(
                                    color: AppColors.backgroundColor,
                                    fontSize: SizeConfig.setSp(14),
                                    letterSpacing: 1,
                                  ),
                                ),
                                TextSpan(
                                  text: snapshot.data != null
                                      ? model.user.score.toString()
                                      : "0",
                                  style: TextStyle(
                                    color: AppColors.backgroundColor,
                                    fontSize: SizeConfig.setSp(16),
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizeConfig.verticalSpacer(15),
                    isDiceRolling
                        ? Image.asset(Assets.imagesDiceRolling)
                        : Container(
                            width: SizeConfig.relativeHeight(24.63),
                            height: SizeConfig.relativeHeight(24.63),
                            decoration: BoxDecoration(
                              color: Color(0xffd0021b),
                              borderRadius: BorderRadius.circular(23),
                            ),
                            child: Image.asset(model.images[imagePosition]),
                            alignment: Alignment.center,
                          ),
                    SizeConfig.verticalSpacer(3),
                    model.user.attemptRemain != 0
                        ? Container(
                            width: SizeConfig.relativeHeight(24.63),
                            alignment: Alignment.center,
                            height: SizeConfig.relativeHeight(24.63),
                            child:
                                Text("Attempts Left : ${model.user.attemptRemain}"))
                        : Container(
                            width: SizeConfig.relativeHeight(30),
                            height: SizeConfig.relativeHeight(30),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("No Attempts Left"),
                                SizeConfig.verticalSpacer(4),
                              ],
                            ),
                          ),
                    Spacer(),
                    CircularButton(
                      width: SizeConfig.relativeWidth(53.33),
                      height: SizeConfig.relativeHeight(5.66),
                      title: "Play",
                      isDisable: model.user.attemptRemain==10||isDiceRolling?true:false,
                      callback: () {
                        setState(() {
                          isDiceRolling = true;
                        });
                        Future.delayed(const Duration(milliseconds: 2000), () {
                          playDice(model);
                        });
                      },
                      // callback: () => playDice(model),
                    ),
                    SizeConfig.verticalSpacer(3),
                  ],
                ),
              )
            : Container();
      },
      stream: userController.stream,
    );
  }

  playDice(HomeViewModel model) async {
    int min = 1, max = 7;
    int generatedNumber = min + rnd.nextInt(max - min);
    this.imagePosition = generatedNumber - 1;
    model.user.score = model.user.score+generatedNumber;
    model.user.attemptRemain = model.user.attemptRemain-1;

    FirebaseService.updateUser(model.user.toMap()).then((value) {
      if(model.user.attemptRemain==0)
        {
          FirebaseService.setLeaderBoard(model.user.toMap());
        }
      setState(() {
        isDiceRolling = false;
      });

    });
  }
}

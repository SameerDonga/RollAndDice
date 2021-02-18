import 'package:rollanddice/constants/route_names.dart';
import 'package:rollanddice/ui/shared/app_colors.dart';
import 'package:rollanddice/ui/shared/size_config.dart';
import 'package:rollanddice/ui/views/BaseCommonWidget.dart';
import 'package:rollanddice/ui/widgets/CircularButton.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:rollanddice/ui/views/Landing/LandingViewModel.dart';
class LandingView extends StatefulWidget {
  @override
  _LandingViewState createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> with BaseCommonWidget,SingleTickerProviderStateMixin {

  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      SizeConfig().init(ctx, constraints);
      return ViewModelProvider<LandingViewModel>.withConsumer(
        viewModel: LandingViewModel(context),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: _getBody(model),
          );
        },
        onModelReady: (model) async {
          model.getAPIVersion();
        },
      );
    });
  }

  Widget _getBody(LandingViewModel model) {
    return Stack(
      children: <Widget>[
        ///Main Body
        _getBaseContainer(model),

        ///Progress Indicator
        getProgressBar(model.state),
      ],
    );
  }

  _getBaseContainer(LandingViewModel model) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
           Text("Roll & Dice",
              style: TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: SizeConfig.setSp(22),
                fontWeight: FontWeight.w700,
              )
          ),
          SizeConfig.verticalSpacer(35),
          CircularButton(
            width: SizeConfig.relativeWidth(53.33),
            height: SizeConfig.relativeHeight(5.66),
            title: "Login",
            isDisable: false,
            callback: ()=>model.redirectToPage(LoginViewRoute),
          ),

          SizeConfig.verticalSpacer(5),
          CircularButton(
            width: SizeConfig.relativeWidth(53.33),
            height: SizeConfig.relativeHeight(5.66),
            title: "Register",
            isDisable: false,
            callback: ()=>model.redirectToPage(SignUpViewRoute),

          ),
          SizeConfig.verticalSpacer(25),
          Text('App Version : ${ model.apiVersion}'),
          SizeConfig.verticalSpacer(4),

        ],
      ),
    );
  }
}

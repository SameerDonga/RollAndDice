import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:rollanddice/services/validation_checks.dart';
import 'package:rollanddice/ui/shared/app_colors.dart';
import 'package:rollanddice/ui/shared/app_theme.dart';
import 'package:rollanddice/ui/shared/size_config.dart';
import 'package:rollanddice/ui/views/BaseCommonWidget.dart';
import 'package:rollanddice/ui/widgets/CircularButton.dart';
import 'package:rollanddice/ui/widgets/CustomTextFiledWithHitText.dart';
import 'package:rollanddice/ui/views/Login/LoginViewModel.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with BaseCommonWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginViewModel>.withConsumer(
      viewModel: LoginViewModel(context),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: _getBody(model),
        );
      },
      onModelReady: (model) async {},
    );
  }

  Widget _getBody(LoginViewModel model) {
    return Stack(
      children: <Widget>[
        ///Main Body
        _getBaseContainer(model),

        ///Progress Indicator
        getProgressBar(model.state),
      ],
    );
  }

  _getBaseContainer(LoginViewModel model) {
    return Container(
      width: double.infinity,
      padding: AppTheme.getContentPadding(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(onTap:(){
                  Navigator.pop(context);
                },child: Icon(Icons.close,size: SizeConfig.setSp(30),)),
              ],
            ),
            SizeConfig.verticalSpacer(20),
            Text(
              "Please enter your email & password below to login your existing account",
              style: TextStyle(
                color: AppColors.text2Color,
                fontSize: SizeConfig.setSp(15),
              ),
              textAlign: TextAlign.center,
            ),
            SizeConfig.verticalSpacer(15),
            CustomTextFiledWithHitText(
              textEditingController: emailController,
              hint: "Email",
            ),
            SizeConfig.verticalSpacer(3),
            CustomTextFiledWithHitText(
              textEditingController: passwordController,
              hint: "Password",
              obscureText: true,
            ),
            SizeConfig.verticalSpacer(5),
            CircularButton(
              width: SizeConfig.relativeWidth(53.33),
              height: SizeConfig.relativeHeight(5.66),
              title: "Login",
              isDisable: false,
              callback: () => validateData(model),
            ),
          ],
        ),
      ),
    );
  }

  validateData(LoginViewModel model) {

      if (emailController.text.isEmpty ||
          !ValidationChecks.validateEmail(emailController.text)) {
        model.showMessageInFlushBar("Please Enter Email", true);
        return;
      }
      if (passwordController.text.isEmpty ||
          passwordController.text.length < 6) {
        model.showMessageInFlushBar("Min password length is 6", true);
        return;
      }
      model.loginToFirebase(
              email: emailController.text.trim(),
              password: passwordController.text.trim());

  }
}

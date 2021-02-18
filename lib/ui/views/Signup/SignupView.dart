import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:rollanddice/services/validation_checks.dart';
import 'package:rollanddice/ui/shared/app_colors.dart';
import 'package:rollanddice/ui/shared/app_theme.dart';
import 'package:rollanddice/ui/shared/size_config.dart';
import 'package:rollanddice/ui/views/BaseCommonWidget.dart';
import 'package:rollanddice/ui/widgets/CircularButton.dart';
import 'package:rollanddice/ui/widgets/CustomTextFiledWithHitText.dart';
import 'package:rollanddice/ui/views/Signup/SignupViewModel.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> with BaseCommonWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return ViewModelProvider<SignUpViewModel>.withConsumer(
      viewModel: SignUpViewModel(context),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: _getBody(model),
        );
      },
      onModelReady: (model) async {},
    );
  }

  Widget _getBody(SignUpViewModel model) {
    return Stack(
      children: <Widget>[
        ///Main Body
        _getBaseContainer(model),

        ///Progress Indicator
        getProgressBar(model.state),
      ],
    );
  }
  final node = FocusNode();
  _getBaseContainer(SignUpViewModel model) {

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
            SizeConfig.verticalSpacer(15),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: SizeConfig.relativeWidth(6)),
              child: Text(
                "Please fill your details below to register your account",
                style: TextStyle(
                  color: AppColors.text2Color,
                  fontSize: SizeConfig.setSp(15),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizeConfig.verticalSpacer(15),
            CustomTextFiledWithHitText(
              textEditingController: fullNameController,
              hint: "Full Name",
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
            ),
            SizeConfig.verticalSpacer(3),
            CustomTextFiledWithHitText(
              textEditingController: emailController,
              hint: "Email",
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),


            ),
            SizeConfig.verticalSpacer(3),
            CustomTextFiledWithHitText(
              textEditingController: passwordController,
              hint: "Password",
              obscureText: true,
                textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => validateDate(model)


            ),
            SizeConfig.verticalSpacer(5),
            CircularButton(
              width: SizeConfig.relativeWidth(53.33),
              height: SizeConfig.relativeHeight(5.66),
              title: "Register",
              isDisable: false,
              callback: () => validateDate(model)
            ),
          ],
        ),
      ),
    );
  }


  validateDate(SignUpViewModel model) {
    if (fullNameController.text.isEmpty ) {
      model.showMessageInFlushBar("Please Enter Name", true);
      return;
    }
    if (emailController.text.isEmpty ||
        !ValidationChecks.validateEmail(emailController.text)) {
      model.showMessageInFlushBar("Please Enter Valid Email", true);
      return;
    }
    if (passwordController.text.isEmpty ||
        passwordController.text.length < 6) {
      model.showMessageInFlushBar("Min password length is 6", true);
      return;
    }
    model.registerToFirebase(email: emailController.text.trim(),
        password: passwordController.text.trim(),
        fullName: fullNameController.text.trim());
  }
}

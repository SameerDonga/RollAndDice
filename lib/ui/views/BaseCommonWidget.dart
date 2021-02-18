import 'package:rollanddice/ui/shared/app_colors.dart';
import 'package:rollanddice/ui/loaders/color_loader_5.dart';
import 'package:rollanddice/ui/views/base_model.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseCommonWidget {
  void showErrorMessage(BuildContext context, String message, bool isError) {
    try {
      if (message != null) {
        Flushbar(
          message: message,
          flushbarStyle: FlushbarStyle.GROUNDED,
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor:
              isError ? Colors.red : AppColors.enabledButtonBackgroundColor,
        )..show(context);
      }
    } catch (e) {
      print(e);
    }
  }

  Widget getProgressBar(ViewState viewState) {
    if (viewState == ViewState.Busy) {
      return Container(
        color: Colors.white.withAlpha(204),
        child: Center(
          child: ColorLoader5(
            dotOneColor: Colors.blue,
            dotTwoColor: Colors.lightBlue,
            dotThreeColor: Colors.lightBlueAccent,
          ),
        ),
      );
    } else {
      return Container();
    }
  }



  backPress(BuildContext context) {
    Navigator.of(context).pop();
  }





}

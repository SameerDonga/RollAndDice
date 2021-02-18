import 'package:rollanddice/ui/shared/app_theme.dart';
import 'package:rollanddice/ui/shared/size_config.dart';
import 'package:rollanddice/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';

import '../shared/app_colors.dart';

class CircularButton extends StatelessWidget {
  final String title;
  final bool isDisable;
  final Function callback;
  final double height;
  final double width;

  const CircularButton(
      {Key key,
      this.title,
      this.isDisable = false,
      this.callback,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:isDisable?null: callback,
      child: Container(
        height: height,
        width: width,
//        margin: EdgeInsets.all(SizeConfig.relativeWidth(2)),
        decoration: BoxDecoration(
            color:
                isDisable ?AppTheme.lighten(AppColors.plRedColor,0.4)  : AppColors.plRedColor,
            borderRadius: BorderRadius.all(Radius.circular(height / 2)),
            border: Border.all(
              width: 1,
              color:isDisable ?AppTheme.lighten(AppColors.plRedColor,0.4)  : AppColors.plRedColor,
            )),
        child: Center(
          child: Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color:
                  isDisable ? AppColors.plRedColor : AppColors.backgroundColor,
              fontFamily: AppTheme.ffRegular,
              fontWeight: FontWeight.w700,
              fontSize: SizeConfig.setSp(12),
            ),
          ),
        ),
      ),
    );
  }
}

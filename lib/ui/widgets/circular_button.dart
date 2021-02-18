import 'package:rollanddice/ui/shared/app_colors.dart';
import 'package:rollanddice/ui/shared/app_theme.dart';
import 'package:rollanddice/ui/shared/size_config.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final String title;
  final bool whiteColor;
  final Function callback;
  final double height;
  final double width;

  const CircularButton(
      {Key key,
      this.title,
      this.whiteColor = false,
      this.callback,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
          height: height,
          width: width,
//        margin: EdgeInsets.all(SizeConfig.relativeWidth(2)),
          decoration: BoxDecoration(
              color: whiteColor ? AppColors.backgroundColor : AppColors.popColor,
              borderRadius: BorderRadius.all(Radius.circular(height / 2)),
              border: Border.all(
                width: 1,
                color: AppColors.popColor,
              )),
          child: Center(
            child: Text(title.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: whiteColor
                        ? AppColors.popColor
                        : AppColors.backgroundColor,
                    fontFamily: AppTheme.ffRegular,
                    fontSize: SizeConfig.setSp(12))),
          )),
    );
  }
}

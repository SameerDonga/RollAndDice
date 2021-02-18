import 'package:rollanddice/ui/shared/app_theme.dart';
import 'package:rollanddice/ui/shared/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rollanddice/ui/shared/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize =
      Size.fromHeight(SizeConfig.relativeHeight(7.14)); //

  final String text;
  final String leftIcon;
  final String rightIcon;
  final bool defaultBackButton;
  final Function leftIconCallback;
  final Function rightIconCallback;
  final Color appBarColor;
  final double elevation;
  final bool centerTitle;

  final String fontFamily;
  final Color textColor;
  final double fontSize;
  final dynamic fontWeight;
  final dynamic fontStyle;
  final dynamic letterSpacing;

  final TextStyle _textStyle = TextStyle(
    fontFamily: AppTheme.ffRegular,
    color: AppColors.text3Color,
    fontSize: SizeConfig.setSp(20),
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
  );
  final TextStyle _miniTextStyle = TextStyle(
    fontFamily: AppTheme.ffRegular,
    color: AppColors.text3Color,
    fontSize: SizeConfig.setSp(12),
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
  );

  CustomAppBar(
      {Key key,
      this.text,
      this.leftIcon,
      this.rightIcon,
      this.leftIconCallback,
      this.rightIconCallback,
      this.appBarColor = Colors.white,
      this.elevation = 0,
        this.centerTitle = false,
      this.defaultBackButton = true,
      this.fontFamily,
        this.fontSize,
        this.fontStyle,
        this.fontWeight,
        this.letterSpacing,
        this.textColor

      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appBarColor,
      elevation: elevation,
      title: Text(
        text,
        style: TextStyle(
        fontFamily: fontFamily,
        color:textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        letterSpacing:letterSpacing,
      ),
      ),
      centerTitle: centerTitle,
      leading: defaultBackButton
          ? IconButton(
              icon: Icon(Icons.keyboard_backspace),
              color: Colors.black,
              onPressed: () => Navigator.pop(context),
            )
          : Container(),
      actions: <Widget>[
        rightIcon == null
            ? Container()
            : Container(
          padding: EdgeInsets.only(top:SizeConfig.relativeHeight(1.97) ,bottom:SizeConfig.relativeHeight(2.38) ,right: SizeConfig.relativeWidth(4.26) ),
          height: SizeConfig.relativeHeight(2.47) ,
          child: InkWell(
            onTap: rightIconCallback,
            child: Container(
              width: SizeConfig.relativeWidth(5.36) ,
              height: SizeConfig.relativeHeight(2.47) ,
              child: Image.asset(
                rightIcon,
                fit: BoxFit.contain,
              ),
            ),
          ),
        )
//        IconButton(
//                icon: Image.asset(rightIcon,fit: BoxFit.contain,),
//                onPressed: rightIconCallback,
//              ),
      ],
    );
    /*Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        AppDivider(),
      ],
    );*/
  }
}


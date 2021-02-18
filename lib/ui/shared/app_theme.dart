import 'package:rollanddice/ui/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:rollanddice/ui/shared/app_colors.dart';
import 'package:intl/intl.dart';

class AppTheme {
  //Size size;

  AppTheme._();

  //Number formatting
  static final nubmerFormat = NumberFormat("#,##0.00", "en_US");
  static final nubmerFormat2 = NumberFormat("#,##0", "en_US");

  //Fonts
  static String ffCelias = 'Celias';
  static String ffRegular = 'Celias';
  static String ffBold = 'Celias';
  static String ffMedium = 'Celias';
  static String billabong = 'Billabong';
  static String robotoRegular = "RobotoRegular";

  ///Wedding App Icons
  static String iconHome = 'assets/icons/homeFill.svg';
  static String iconAlbum = 'assets/icons/album.svg';
  static String iconEvent = 'assets/icons/event.svg';
  static String iconCall = 'assets/icons/call.svg';
  static String iconOnCall = 'assets/icons/onCall.svg';
  static String iconAddRound = 'assets/icons/AddRounded.svg';
  static String iconEdit = 'assets/icons/edit.svg';
  static String iconShare = 'assets/icons/share.svg';
  static String iconMenu = 'assets/icons/menu.svg';
  static String iconLogout = 'assets/icons/logout.svg';
  static String iconProfile = 'assets/icons/user.svg';
  static String iconClose = 'assets/icons/close.svg';
  static String iconAddWhite = 'assets/icons/plusWhite.svg';
  static String iconDelete = 'assets/icons/delete.svg';
  static String iconDeleteOpen = 'assets/icons/delete_open.svg';
  static String iconDice = 'assets/icons/dice.gif';



  static String dice1 = 'assets/images/dice1.png';
  static String dice2 = 'assets/images/dice2.png';
  static String dice3 = 'assets/images/dice3.png';
  static String dice4 = 'assets/images/dice4.png';
  static String dice5 = 'assets/images/dice5.png';
  static String dice6 = 'assets/images/dice6.png';
  static String logoPlaceholder = 'assets/images/group_member.jpg';
  static String placeholder = 'assets/images/placeholder.png';
  static String placeholderjpg = 'assets/images/placeholder.jpg';
  static String userProfilePlaceHolder =
      'assets/images/user_profile_place_holder.png';

  static double primaryTextSize = 15.0;

  static TextStyle titleTextStyle = TextStyle(
    fontSize: 18.0,
    fontFamily: ffRegular,
    color: AppColors.primaryTextColor,
    height: 1.11,
  );

  static TextStyle title2TextStyle = TextStyle(
    fontSize: 20.0,
    fontFamily: ffRegular,
    fontWeight: FontWeight.w600,
    color: AppColors.text1Color,
    letterSpacing: 0.56,
    height: 1,
  );

  static TextStyle title3TextStyle = TextStyle(
    fontSize: 19.0,
    fontFamily: ffRegular,
    fontWeight: FontWeight.w600,
    color: AppColors.text1Color,
    height: 1.05,
  );

  static TextStyle title4TextStyle = TextStyle(
    fontSize: 12.0,
    fontFamily: ffRegular,
    color: AppColors.text1Color,
    height: 1.67,
  );

  static TextStyle title5TextStyle = TextStyle(
    fontSize: 16.6,
    fontFamily: ffRegular,
    color: Color(0xFF696969),
    height: 1.5,
  );

  static TextStyle titleTextOpacityStyle = TextStyle(
    fontStyle: FontStyle.normal,
    fontSize: 15.0,
    fontFamily: ffRegular,
    color: AppColors.text2Color,
    height: 1.61,
  );

  static TextStyle titleTextOpacity2Style = TextStyle(
    fontSize: 12.0,
    fontFamily: ffRegular,
    color: AppColors.text2Color,
    height: 1.29,
    fontStyle: FontStyle.italic,
  );

  static TextStyle boldTextStyle = TextStyle(
    fontSize: 22.0,
    fontFamily: ffBold,
    color: AppColors.primaryTextColor,
    height: 0.91,
  );

  static TextStyle bold2TextStyle = TextStyle(
    fontSize: 13.0,
    fontFamily: ffBold,
    color: AppColors.primaryTextColor,
    height: 1.85,
  );

  static TextStyle bold3TextStyle = TextStyle(
    fontSize: 25.0,
    fontFamily: ffBold,
    color: AppColors.plRedColor,
    height: 1.2,
  );

  static TextStyle bold4TextStyle = TextStyle(
    fontSize: 18.0,
    fontFamily: ffBold,
    color: AppColors.text1Color,
  );

  static InputDecoration inputDecoration = InputDecoration(
    contentPadding: const EdgeInsets.only(
      left: 20,
      top: 8.0,
      bottom: 8.0,
    ),
    enabledBorder: new UnderlineInputBorder(
      borderSide: new BorderSide(color: Color(0xFFDDDDDD)),
    ),
    focusedBorder: new UnderlineInputBorder(
      borderSide: new BorderSide(color: Color(0xFFDDDDDD)),
    ),
    labelStyle: AppTheme.titleTextStyle,
  );

  static InputDecoration inputDecorationWithIcon(String path) =>
      inputDecoration.copyWith(
          hintStyle: TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 14.0,
            fontFamily: ffRegular,
            color: Color(0XFF5a5a5a),
          ),
          hintText: 'Mobile Number',
          prefixIconConstraints: BoxConstraints(
            maxHeight: SizeConfig.relativeWidth(10),
            maxWidth: SizeConfig.relativeWidth(10),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: SizeConfig.relativeWidth(5)),
            child: Image.asset(
              path,
              fit: BoxFit.contain,
            ),
          ));

  static get() {
    return ThemeData(
      fontFamily: ffRegular,
      brightness: Brightness.light,
      primaryColor: AppColors.primaryTextColor,
      backgroundColor: AppColors.backgroundColor,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      appBarTheme: AppBarTheme(
        elevation: 0.5,
        brightness: Brightness.light,
        color: AppColors.backgroundColor,
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }

  static Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  static getContentPadding({double bottom = 0}) {
    return EdgeInsets.only(
      left: SizeConfig.relativeWidth(4),
      right: SizeConfig.relativeWidth(4),
      top: SizeConfig.relativeHeight(2.5),
      bottom: SizeConfig.relativeHeight(bottom)
    );
  }
}

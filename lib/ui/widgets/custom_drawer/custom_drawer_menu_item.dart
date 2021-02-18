import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rollanddice/ui/shared/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rollanddice/ui/shared/app_theme.dart';
import 'package:rollanddice/ui/shared/size_config.dart';

class CustomDrawerMenuItem extends StatelessWidget {
  const CustomDrawerMenuItem(
      {Key key,
      this.title,
      this.icon,
      this.height,
      this.onTap,
      this.titleColor/*= const Color(0xffd0021b)}*/
      })
      : super(key: key);

  final String title;
  final IconData icon;
  final Color titleColor;
  final double height;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.only(top: SizeConfig.relativeHeight(3.69)),
        height: height,
//        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
//              color: Colors.amber,
              width: SizeConfig.relativeWidth(5),
              child: Icon(
                icon,
                color: AppColors.plRedColor,
              ),
            ),
            SizeConfig.horizontalSpacer(6.93),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: AppColors.plRedColor,
                    fontSize: SizeConfig.setSp(14),
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

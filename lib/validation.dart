

import 'package:rollanddice/ui/views/base_model.dart';

class Validation extends BaseModel {
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value == null || value.isEmpty) {
      return translate("Please Enter Valid Email");
    } else if (!regex.hasMatch(value))
      return translate("Email is Invalid");
    else
      return null;
  }

  String validateMobile(String value) {
    if (value == null || value.isEmpty) {
      return translate("Please Enter Mobile Number");
    }
//    else if (value.length < 6 || value.length > 12) {
//      return allTranslations.text(AppLocalizationsKey.invalidMobile);
//    }
    return null;
  }
}
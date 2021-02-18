import 'package:rollanddice/ui/shared/app_colors.dart';
import 'package:rollanddice/ui/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFiledWithHitText extends StatelessWidget {
  final String hint;
  final Function onFieldSubmitted;
  final Function(String) onChanged;
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final TextInputAction textInputAction;
  final bool autoFocus;
  final List<TextInputFormatter> inputFormatters;
  final int maxLines;
  final int minLines;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final bool obscureText;

  CustomTextFiledWithHitText({
    this.hint = "Provide Hint",
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.textEditingController,
    this.focusNode,
    this.textInputAction,
    this.inputFormatters,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.readOnly = false,
    this.minLines = 1,
    this.obscureText = false
  });

  @override
  Widget build(BuildContext context) {
    return maxLines == 1 ? Container(
      height: SizeConfig.relativeHeight(5.91),
      child: TextFormField(
        maxLines: maxLines,
        minLines: 1,
        keyboardType: TextInputType.text,
        textInputAction: textInputAction,
        obscureText: obscureText,
        cursorColor: AppColors.text1Color,
        inputFormatters: inputFormatters,
        textCapitalization: textCapitalization,
        onFieldSubmitted: onFieldSubmitted,
        readOnly: readOnly,
        style: TextStyle(
          fontSize: SizeConfig.setSp(16),
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          letterSpacing: 0,
        ),
        onChanged: onChanged,
        focusNode: focusNode,
        controller: textEditingController,
        autofocus: autoFocus,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
              top: maxLines == 1 ? SizeConfig.relativeHeight(1.4) : SizeConfig.relativeHeight(3),
              left: SizeConfig.relativeWidth(3),
              right: SizeConfig.relativeHeight(3),bottom: SizeConfig.relativeHeight(1.4)),
          hintText: hint,
          labelText: hint,
          alignLabelWithHint: true,
          disabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.textFieldBorderColor, width: 1)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.textFieldBorderColor, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.textFieldBorderColor, width: 1)),
          errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.textFieldBorderColor, width: 1)),
          border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.textFieldBorderColor, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.textFieldBorderColor, width: 1)),
          labelStyle: TextStyle(
            color: AppColors.profileTextFiledHint,
            fontSize: SizeConfig.setSp(14),
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          hintStyle: TextStyle(
            color: AppColors.profileTextFiledHint,
            fontSize: SizeConfig.setSp(13),
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    ) : Flexible(
      child: TextFormField(
        maxLines: maxLines,
        minLines: minLines,
        keyboardType: TextInputType.text,
        textInputAction: textInputAction,
        // obscureText: true,
        cursorColor: AppColors.text1Color,
        inputFormatters: inputFormatters,
        textCapitalization: textCapitalization,
        onFieldSubmitted: onFieldSubmitted,

        readOnly: readOnly,
        style: TextStyle(
          fontSize: SizeConfig.setSp(16),
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          letterSpacing: 0,
        ),
        onChanged: onChanged,
        focusNode: focusNode,
        controller: textEditingController,
        autofocus: autoFocus,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
              top: maxLines == 1 ? SizeConfig.relativeHeight(1.4) : SizeConfig.relativeHeight(3),
              left: SizeConfig.relativeWidth(3),
              right: SizeConfig.relativeHeight(3),bottom: SizeConfig.relativeHeight(1.4)),
          hintText: hint,
          labelText: hint,
          alignLabelWithHint: true,
          disabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: AppColors.textFieldBorderColor, width: 1)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: AppColors.textFieldBorderColor, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: AppColors.textFieldBorderColor, width: 1)),
          errorBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: AppColors.textFieldBorderColor, width: 1)),
          border: OutlineInputBorder(
              borderSide:
              BorderSide(color: AppColors.textFieldBorderColor, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: AppColors.textFieldBorderColor, width: 1)),
          labelStyle: TextStyle(
            color: AppColors.profileTextFiledHint,
            fontSize: SizeConfig.setSp(14),
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          hintStyle: TextStyle(
            color: AppColors.profileTextFiledHint,
            fontSize: SizeConfig.setSp(13),
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}

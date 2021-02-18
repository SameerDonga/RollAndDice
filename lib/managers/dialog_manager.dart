import 'package:rollanddice/locator.dart';
import 'package:rollanddice/models/dialog_models.dart';
import 'package:rollanddice/services/dialog_service.dart';
import 'package:rollanddice/services/localization_service.dart';
import 'package:rollanddice/ui/shared/app_theme.dart';
import 'package:rollanddice/ui/shared/size_config.dart';
import 'package:rollanddice/ui/widgets/circular_button.dart';
import 'package:flutter/material.dart';
import 'package:rollanddice/ui/shared/app_colors.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  DialogManager({Key key, this.child}) : super(key: key);

  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();
  LocalizationService _localizationService = locator<LocalizationService>();
  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
    _dialogService.registerCustomDialogListener(_showCutomDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(DialogRequest request) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Dialog(
              /*shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),*/
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: buildChild(context, request),
            ));
  }

  void _showCutomDialog(Widget child) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Dialog(
              /*shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),*/
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: child,
            ));
  }


  Widget buildDialogButton(String title, bool whiteColor, Function callback) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.only(
            left: SizeConfig.relativeWidth(3),
            right: SizeConfig.relativeWidth(3)),
        child: CircularButton(
          height: SizeConfig.relativeHeight(6),
          whiteColor: whiteColor,
          title: title,
          callback: callback,
        ),
      ),
    );
  }

  Widget buildChild(BuildContext context, DialogRequest request) {
    var isConfirmationDialog = request.cancelTitle != null;

    var column = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: AppColors.popColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          height: SizeConfig.relativeHeight(10),
          child: Center(
              child: Text(
            request.title,
            maxLines: 1,
            style: TextStyle(
              color: AppColors.backgroundColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              letterSpacing: 0,
            ),
          )),
        ),
        Container(
          color: AppColors.backgroundColor.withOpacity(1),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                request.description,
                style: TextStyle(
                    fontFamily: AppTheme.ffRegular,
                    color: AppColors.popColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                    height: 1.71),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        SizeConfig.verticalSpacer(1),
        Container(
            /*decoration: BoxDecoration(
                color: AppTheme.backgroundColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),*/
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isConfirmationDialog)
              buildDialogButton(
                  request.cancelTitle,
                  true,
                  () => _dialogService
                      .dialogComplete(DialogResponse(confirmed: false))),
            //if (isConfirmationDialog) SizeConfig.horizontalSpacer(10),
            buildDialogButton(
                request.buttonTitle,
                isConfirmationDialog ? false : true,
                () => _dialogService
                    .dialogComplete(DialogResponse(confirmed: true)))
          ],
        )),
        SizeConfig.verticalSpacer(3)
      ],
    );
    return WillPopScope(
      onWillPop: () async {
        if (isConfirmationDialog) {
          _dialogService.dialogComplete(DialogResponse(confirmed: false));
        }
        return true;
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: column,
      ),
    );
  }
}

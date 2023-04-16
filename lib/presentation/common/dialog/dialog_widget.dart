import 'package:flutter/material.dart';
import 'package:sof_user_app/app/app.dart';

class DialogWidget {
  static bool _dialogIsVisible(BuildContext context) {
    bool isVisible = false;
    Navigator.popUntil(context, (route) {
      isVisible = route is PopupRoute;

      return !isVisible;
    });

    return isVisible;
  }

  static void get hideLoadingDialog {
    if (_dialogIsVisible(NavigationUtil.currentContext!)) {
      Navigator.of(NavigationUtil.currentContext!).pop();
    }
  }

  static void showLoadingDialog(BuildContext context) async {
    final loadingDialog = Stack(
      children: const [
        Center(
          child: CircularProgressIndicator(
            strokeWidth: 6,
            color: Colors.orange,
          ),
        ),
      ],
    );

    if (!_dialogIsVisible(NavigationUtil.currentContext!)) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return loadingDialog;
        },
      );
    }
  }
}

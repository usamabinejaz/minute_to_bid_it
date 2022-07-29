import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

getWaitingDialog({required BuildContext context, bool? circular}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return circular ?? true
          ? Center(
              child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).indicatorColor),
            ))
          : Center(
              child: LinearProgressIndicator(
                color: Theme.of(context).indicatorColor,
              ),
            );
    },
  );
}

getDialog({
  required Widget title,
  required Widget content,
  required String closeText,
  String? okText,
  VoidCallback? okOnPressed,
  bool? barrierDismissible,
  required BuildContext context,
}) {
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    getCupertinoDialog(
      closeWidget: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(closeText),
      ),
      context: context,
      content: content,
      title: title,
      okWidget: okText != null
          ? TextButton(
              child: Text(okText),
              onPressed: okOnPressed,
            )
          : null,
      barrierDismissible: barrierDismissible,
    );
  } else {
    getMaterialDialog(
      closeWidget: TextButton(
        child: Text(closeText),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      context: context,
      content: content,
      title: title,
      okWidget: okText != null
          ? TextButton(
              child: Text(okText),
              onPressed: okOnPressed,
            )
          : null,
      barrierDismissible: barrierDismissible,
    );
  }
}

getMaterialDialog({
  required Widget title,
  required Widget content,
  required Widget closeWidget,
  Widget? okWidget,
  bool? barrierDismissible,
  required BuildContext context,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).primaryColor,
        title: title,
        content: content,
        actions: <Widget>[
          if (okWidget != null) okWidget,
          closeWidget,
        ],
      );
    },
  );
}

getCupertinoDialog({
  required Widget title,
  required Widget content,
  required Widget closeWidget,
  Widget? okWidget,
  bool? barrierDismissible,
  required BuildContext context,
}) {
  showDialog(
    barrierDismissible: barrierDismissible ?? true,
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: title,
        content: content,
        actions: <Widget>[
          closeWidget,
          if (okWidget != null) okWidget,
        ],
      );
    },
  );
}

getSnackBar(context, text) {
  final snackBar = SnackBar(
    content: Text(text),
  );
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

class CustomDialog {
  static Widget showCircularProgressIndicator({double? size = 30}) =>
      SizedBox(height: size, width: size, child: CircularProgressIndicator());

  static ProgressDialog showProgressDialog({
    required BuildContext context,
    required String message,
    String? title,
  }) {
    return ProgressDialog(
      context,
      message: Text(message),
      title: Text(title ?? "Loading..."),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/utils/LoadingDialogUtils.dart';

class DialogUtils {

  static LoadingDialogUtils dialogUtils;

  static void show(BuildContext context, String msg) {
    dialogUtils = new LoadingDialogUtils(
      //调用对话框
      text: msg,
    );
    showDialog<Null>(
        context: context, //BuildContext对象
        barrierDismissible: true,
        builder: (BuildContext context) {
          return dialogUtils;
        });
  }

  static void hidden() {
    if (dialogUtils != null) {
      dialogUtils.dismiss();
    }
  }

}
import 'package:app_flutter/share/base_component/app_toast/src/alert_controller.dart';
import 'package:flutter/material.dart';

import 'src/dropdown_alert.dart';
import 'src/model/data_alert.dart';

class AppToast {
  AppToast._();
  static final share = AppToast._();
  late BuildContext context;

  void showToast(
    String message, {
    ToastType type = ToastType.warning,
    String? title,
  }) {
    String titleStr = title ?? '';
    if (titleStr == '') {
      if (type == ToastType.error) {
        titleStr = "Fail";
      } else if (type == ToastType.success) {
        titleStr = "Success";
      } else if (type == ToastType.warning) {
        titleStr = "Warning";
      }
    }
    AlertController.show(titleStr, message, type, TypeToastWidget.normal);
  }

  Widget getInstToInject(BuildContext context) {
    this.context = context;

    return const DropdownAlert();
  }

  void showToastLoginCustom() {
    AlertController.show("Note", "Please login", ToastType.warning, TypeToastWidget.normal);
  }
}

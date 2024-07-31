import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog {
  static void showSuccessDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(SizeConstants.borderRadiusLg.w)),
        );
      },
    );
  }
}

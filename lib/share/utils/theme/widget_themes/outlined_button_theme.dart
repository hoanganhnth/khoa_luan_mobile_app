import 'package:app_flutter/share/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class TOutlinedButtonTheme {
  TOutlinedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme  = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: ColorConstants.dark,
      side: const BorderSide(color: ColorConstants.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: ColorConstants.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: SizeConstants.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeConstants.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: ColorConstants.light,
      side: const BorderSide(color: ColorConstants.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: ColorConstants.textWhite, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: SizeConstants.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeConstants.buttonRadius)),
    ),
  );
}

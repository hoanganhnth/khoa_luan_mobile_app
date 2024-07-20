import 'package:app_flutter/share/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class TElevatedButtonTheme {
  TElevatedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightElevatedButtonTheme  = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: ColorConstants.light,
      backgroundColor: ColorConstants.primary,
      disabledForegroundColor: ColorConstants.darkGrey,
      disabledBackgroundColor: ColorConstants.buttonDisabled,
      side: const BorderSide(color: ColorConstants.primary),
      padding: const EdgeInsets.symmetric(vertical: SizeConstants.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: ColorConstants.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeConstants.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: ColorConstants.light,
      backgroundColor: ColorConstants.primary,
      disabledForegroundColor: ColorConstants.darkGrey,
      disabledBackgroundColor: ColorConstants.darkerGrey,
      side: const BorderSide(color: ColorConstants.primary),
      padding: const EdgeInsets.symmetric(vertical: SizeConstants.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: ColorConstants.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeConstants.buttonRadius)),
    ),
  );
}

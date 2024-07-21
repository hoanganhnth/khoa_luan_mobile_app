import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: SizeConstants.appBarHeight,
    left: SizeConstants.defaultSpace,
    bottom: SizeConstants.defaultSpace,
    right: SizeConstants.defaultSpace,
  );
}
import 'package:app_flutter/share/utils/constants/colors.dart';
import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:app_flutter/share/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SettingProfileRow extends StatelessWidget {
  const SettingProfileRow({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.isLast = false,
  });

  final String title;
  final String icon;
  final Function() onPressed;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: !isLast
                    ? const BorderSide(color: ColorConstants.dividerColor)
                    : BorderSide.none)),
        padding: EdgeInsets.symmetric(vertical: SizeConstants.md.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  color: ColorConstants.iconColor,
                  height: 24.w,
                  width: 24.w,
                ),
                SizedBox(
                  width: SizeConstants.md.w,
                ),
                Text(title,
                    style: Theme.of(context).textTheme.bodyLarge)
              ],
            ),
            const Icon(
              Icons.chevron_right,
              color: ColorConstants.iconColor,
            )
          ],
        ),
      ),
    );
  }
}

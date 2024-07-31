import 'package:app_flutter/share/utils/constants/colors.dart';
import 'package:app_flutter/share/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.leadingIcon,
      this.action,
      this.leadingOnPressed,  this.centerTitle = false});

  final Widget? title;
  final bool showBackArrow;
  final Widget? leadingIcon;
  final List<Widget>? action;
  final VoidCallback? leadingOnPressed;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    final dark = DeviceUtils.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: centerTitle,
        leading: showBackArrow
            ? IconButton(
                onPressed: leadingOnPressed,
                icon: Icon(Iconsax.arrow_left,
                    color: dark ? ColorConstants.white : ColorConstants.black))
            : leadingIcon != null
                ? IconButton(onPressed: leadingOnPressed, icon: leadingIcon!)
                : null,
        title: title,
        actions: action,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());
}


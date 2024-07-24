import 'package:app_flutter/share/utils/constants/colors.dart';
import 'package:app_flutter/share/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class TTaBar extends StatelessWidget implements PreferredSizeWidget{
  const TTaBar({Key? key, required this.tabs}) : super(key: key);

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = DeviceUtils.isDarkMode(context);
    return Material(
      color: dark ? ColorConstants.black : ColorConstants.white,
      child: TabBar(
        physics: const NeverScrollableScrollPhysics(),
        tabs: tabs, 
        indicatorSize: TabBarIndicatorSize.tab,
        // isScrollable: true,
        indicatorColor: ColorConstants.primary,
        unselectedLabelColor: ColorConstants.darkGrey,
        labelColor: ColorConstants.primary,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());
}

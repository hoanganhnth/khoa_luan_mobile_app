import 'package:app_flutter/features/main/presentation/widget/cart_menu_icon.dart';
import 'package:app_flutter/share/base_component/app_bar/appbar.dart';
import 'package:app_flutter/share/utils/constants/colors.dart';
import 'package:app_flutter/share/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBarCustom(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConstants.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: ColorConstants.grey),
          ),
         Text("hoang anh",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: ColorConstants.white))
        ],
        
      ),
       action: const [
        NotificationCounterIcon(
          iconColor: ColorConstants.white,
        )
       ],
      
    );
  }
}

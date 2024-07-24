import 'package:app_flutter/share/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NotificationCounterIcon extends StatelessWidget {
  const NotificationCounterIcon({
    super.key,
    required this.iconColor,
  });

  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      IconButton(
        onPressed: (){},
        icon: const Icon(Iconsax.notification),
        color: iconColor,
      ),
      Positioned(
        right: 0,
        child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: ColorConstants.black,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
                "5",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: ColorConstants.white, fontSizeFactor: 0.8),
              ),
          ),
        ),
      )
    ]);
  }
}

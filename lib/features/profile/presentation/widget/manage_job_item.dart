import 'package:app_flutter/share/utils/constants/colors.dart';
import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ManageJobSettingItem extends StatelessWidget {
  const ManageJobSettingItem({
    super.key, required this.title, required this.icon, required this.number,
  });
  final String title;
  final String icon;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConstants.borderRadiusMd.w),
          color: ColorConstants.cardBg),
      padding: EdgeInsets.symmetric(
          horizontal: SizeConstants.md.w, vertical: SizeConstants.md.w),
      // height: 60.w.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.all(SizeConstants.sm),
              decoration: BoxDecoration(
                  color: ColorConstants.white,
                  borderRadius: BorderRadius.circular(400.w)),
              child: SvgPicture.asset(
                icon,
                width: 25.w,
                height: 25.w,
                color: Theme.of(context).primaryColor,
              )),
          SizedBox(
            height: SizeConstants.md.w,
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              SizedBox(
                width: SizeConstants.md.w,
              ),
              Text(
                number <= 0 ? "" : number.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}

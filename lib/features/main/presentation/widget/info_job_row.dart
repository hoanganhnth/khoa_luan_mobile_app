import 'package:app_flutter/share/utils/constants/colors.dart';
import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InfoShareRow extends StatelessWidget {
  const InfoShareRow({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
  });
  final String title;
  final String content;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConstants.md.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.all(SizeConstants.sm.w),
              decoration: BoxDecoration(
                  color: ColorConstants.bgPrimary,
                  borderRadius: BorderRadius.circular(400)),
              child: SvgPicture.asset(
                icon,
                width: 20.w,
                height: 20.w,
                color: Theme.of(context).primaryColor,
              )),
          SizedBox(
            width: SizeConstants.md.w,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(
                  height: SizeConstants.xs.w,
                ),
                Text(
                  content,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          SizedBox(
            width: SizeConstants.md.w,
          ),
        ],
      ),
    );
  }
}


import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InfoJobColum extends StatelessWidget {
  const InfoJobColum({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.content,
  });
  final String title;
  final String imgUrl;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          imgUrl,
          width: 30.w,
          height: 30.w,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(
          height: SizeConstants.sm.w,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        SizedBox(
          height: SizeConstants.sm.w,
        ),
        Text(
          content,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Theme.of(context).primaryColor),
        ),
      ],
    );
  }
}

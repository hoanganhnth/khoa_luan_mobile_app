import 'package:app_flutter/share/utils/constants/colors.dart';
import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.onPressed,
  });
  final double width;
  final double height;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius:
                BorderRadius.circular(SizeConstants.borderRadiusMd.w)),
        child: Center(
          child: Text(title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: ColorConstants.white,
                  )),
        ),
      ),
    );
  }
}

import 'package:app_flutter/share/base_component/image/image.dart';
import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.imageUrl,
    this.margin,
    this.width,
    this.height,
  });
  final String imageUrl;
  final EdgeInsets? margin;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConstants.sm.w),
      margin: margin,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(SizeConstants.borderRadiusMd.w),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: imageFromNetWork(
          url: imageUrl, width: width ?? 60.w, height: height ?? 60.w),
    );
  }
}

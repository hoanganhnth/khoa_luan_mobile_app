import 'package:app_flutter/share/utils/constants/animation_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(AnimationConstants.aniLoading, width: 250.w, height: 250.w),);
  }
}
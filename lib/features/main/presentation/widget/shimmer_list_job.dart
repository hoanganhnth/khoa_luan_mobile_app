import 'package:app_flutter/share/base_component/loading/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerListJob extends StatelessWidget {
  const ShimmerListJob({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return ShimmerEffect(width: double.infinity, height: 80.w);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 16.w,
        );
      },
      itemCount: 4,
    );
  }
}

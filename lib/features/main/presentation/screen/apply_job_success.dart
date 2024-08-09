import 'package:app_flutter/features/main/presentation/widget/info_apply_job_row.dart';
import 'package:app_flutter/share/base_component/button/custom_button.dart';
import 'package:app_flutter/share/utils/constants/animation_constants.dart';
import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:app_flutter/share/utils/constants/string_constants.dart';
import 'package:app_flutter/share/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ApplyJobSuccess extends StatelessWidget {
  const ApplyJobSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final paddingBottom = DeviceUtils.getPaddingBottom(context);

    return Scaffold(
      bottomNavigationBar: Container(
          padding: EdgeInsets.only(
              left: SizeConstants.md.w,
              right: SizeConstants.md.w,
              bottom: paddingBottom > 0
                  ? paddingBottom + SizeConstants.md.w
                  : SizeConstants.md.w,
              top: SizeConstants.md.w),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: CustomButton(
            height: 42.w,
            width: 320.w,
            title: StringConstants.continueApply,
            onPressed: () {
              Modular.to.navigate(
                "/home",
              );
            },
          )),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
              top: SizeConstants.lg.w + DeviceUtils.getAppBarHeight(),
              left: SizeConstants.md.w,
              right: SizeConstants.md.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(AnimationConstants.aniApply,
                  width: 150.w, height: 150.w),
              SizedBox(
                height: SizeConstants.md.w,
              ),
              Text(
                "Ứng tuyển thành công",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 32.w,
              ),
              const Column(
                children: [
                  RowInforApplyJobRow(
                    title: StringConstants.company,
                    content: "TNHH THANH CONG",
                  ),
                  RowInforApplyJobRow(
                    title: StringConstants.job,
                    content: "Develop Flutter",
                  ),
                  RowInforApplyJobRow(
                    title: StringConstants.applyAt,
                    content: "15h30p, 10-5-2004",
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

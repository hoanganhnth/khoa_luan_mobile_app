import 'package:app_flutter/features/main/data/model/job_model.dart';
import 'package:app_flutter/share/base_component/image/image_container.dart';
import 'package:app_flutter/share/utils/constants/colors.dart';
import 'package:app_flutter/share/utils/constants/icon_constants.dart';
import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:app_flutter/share/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

class JobItemWidget extends StatefulWidget {
  const JobItemWidget({
    super.key,
    required this.jobModel,
  });
  final JobModel jobModel;

  @override
  State<JobItemWidget> createState() => _JobItemWidgetState();
}

class _JobItemWidgetState extends State<JobItemWidget> {
  ValueNotifier<bool> isBookMark = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to
          .pushNamed("/detail_job", arguments: {"job_model": widget.jobModel}),
      child: Container(
        padding: EdgeInsets.all(SizeConstants.spaceBtwItems.w),
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(SizeConstants.borderRadiusMd),
            border: Border.all(color: Theme.of(context).primaryColor)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageContainer(
                  imageUrl: widget.jobModel.imageUrl ?? "",
                  margin: EdgeInsets.only(right: SizeConstants.md.w),
                  width: 40.w,
                  height: 40.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.jobModel.title ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: SizeConstants.xs.w,
                      ),
                      Text(
                        widget.jobModel.companyName ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(
                        height: SizeConstants.xs.w,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConstants.sm.w,
                            vertical: SizeConstants.xs.w),
                        decoration: BoxDecoration(
                            color: ColorConstants.softGrey,
                            borderRadius: BorderRadius.circular(
                                SizeConstants.borderRadiusMd.w)),
                        child: Text(
                          widget.jobModel.locationName ?? "",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: SizeConstants.xs.w,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConstants.sm.w,
                            vertical: SizeConstants.xs.w),
                        decoration: BoxDecoration(
                            color: ColorConstants.bgPrimary,
                            borderRadius: BorderRadius.circular(
                                SizeConstants.borderRadiusMd.w)),
                        child: Text(
                          widget.jobModel.salary ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Theme.of(context).primaryColor),
                        ),
                      )
                    ],
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: isBookMark,
                  builder: (BuildContext context, bool value, Widget? child) {
                    return InkWell(
                      onTap: () => isBookMark.value = !value,
                      child: SvgPicture.asset(
                        width: 15.w,
                        height: 25.w,
                        value
                            ? IconConstants.icBookMarkActive
                            : IconConstants.icBookMark,
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  },
                )
              ],
            ),
            SizedBox(
              height: SizeConstants.xs.w,
            ),
            if (widget.jobModel.calculatorTimeRemaining() != 0)
              Container(
                padding: EdgeInsets.only(top: 10.w),
                margin: EdgeInsets.only(top: SizeConstants.xs.w),
                decoration: const BoxDecoration(
                    border:
                        Border(top: BorderSide(color: ColorConstants.grey))),
                child: Row(
                  children: [
                    const Icon(
                      Iconsax.clock,
                      color: ColorConstants.darkGrey,
                      size: 16,
                    ),
                    SizedBox(
                      width: SizeConstants.xs.w,
                    ),
                    Text.rich(TextSpan(
                        text: StringConstants.remain,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: ColorConstants.darkGrey))),
                    Text.rich(TextSpan(
                        text: " ${widget.jobModel.calculatorTimeRemaining()} ",
                        style: Theme.of(context).textTheme.labelSmall)),
                    Text.rich(TextSpan(
                        text: StringConstants.timeToApply,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: ColorConstants.darkGrey))),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}

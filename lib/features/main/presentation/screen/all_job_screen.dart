import 'package:app_flutter/features/main/data/model/job_model.dart';
import 'package:app_flutter/features/main/presentation/widget/job_item_widget.dart';
import 'package:app_flutter/share/base_component/app_bar/appbar.dart';
import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:app_flutter/share/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllJobScreen extends StatefulWidget {
  const AllJobScreen({super.key, required this.listJobs});
  final List<JobModel> listJobs;

  @override
  State<AllJobScreen> createState() => _AllJobScreenState();
}

class _AllJobScreenState extends State<AllJobScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          showBackArrow: true,
          leadingOnPressed: () =>Modular.to.pop(),
          title: const Text(StringConstants.hintSuitableJob),
        ),
        body: ListView.builder(
          
          itemCount: widget.listJobs.length,
          padding: EdgeInsets.symmetric(horizontal: SizeConstants.md.w),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                margin: EdgeInsets.only(
                    bottom: index != widget.listJobs.length - 1
                        ? SizeConstants.sm.w
                        : 0),
                child: JobItemWidget(
                  jobModel: widget.listJobs[index],
                ));
          },
        ));
  }
}

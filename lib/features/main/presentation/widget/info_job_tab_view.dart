import 'package:app_flutter/features/main/data/model/job_model.dart';
import 'package:app_flutter/features/main/presentation/widget/info_job_row.dart';
import 'package:app_flutter/share/base_component/text/title_list.dart';
import 'package:app_flutter/share/utils/constants/icon_constants.dart';
import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:app_flutter/share/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoJobTabView extends StatelessWidget {
  const InfoJobTabView({
    super.key,
    required this.jobModel,
  });
  final JobModel jobModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: SizeConstants.lg.w, horizontal: SizeConstants.md.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleList(
                  title: StringConstants.infoShare,
                ),
                SizedBox(
                  height: SizeConstants.md.w,
                ),
                const InfoShareRow(
                    content: '1 năm',
                    icon: IconConstants.icStar,
                    title: StringConstants.experience),
                 InfoShareRow(
                  content: "${jobModel.numberCandidates} thành viên",
                  icon: IconConstants.icMember,
                  title: StringConstants.numberRequire,
                ),
                const InfoShareRow(
                  content: "không yêu cầu",
                  icon: IconConstants.icMale,
                  title: StringConstants.sexType,
                ),
                const InfoShareRow(
                  content: "21-8-2024",
                  icon: IconConstants.icTimeHistory,
                  title: StringConstants.timeLine,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleList(
                  title: StringConstants.descriptionJob,
                ),
                SizedBox(
                  height: SizeConstants.sm.w,
                ),
                const Text(
                    "- Flutter Development: Lead the development of our compliance management mobile app using Flutter, adhering to best practices for performance, code quality, and maintainability.\n- UI/UX Implementation: Translate designs and wireframes into high-quality, user-friendly interfaces, with a focus on creating an exceptional user experience.\n- State Management: Implement efficient state management solutions (e.g., BLoC, Provider, Riverpod) to manage the application's data flow and responsiveness.\n- App Store Deployment: Manage the process of publishing the app to both the Apple App Store and Google Play Store, ensuring compliance with all guidelines and requirements.\n- Performance Optimization: Optimize the app's performance by identifying and addressing bottlenecks, ensuring a smooth and responsive user experience.\n- Monitoring and Tracking: Implement tracking and monitoring mechanisms to collect user data, track app usage, and analyze crash reports to identify and resolve issues.\n- Testing: Write unit, widget, and integration tests to ensure the app's stability and functionality across different devices and platforms.\n- Firebase Integration: Leverage Firebase services (e.g., Notifications, Remote Config) to enhance the app's functionality and user engagement.\n- AWS Integration: Integrate with AWS services like Amplify, Cognito, Lambda, and S3, for authentication, storage, and backend functionality.")
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: SizeConstants.md.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleList(
                    title: StringConstants.requireCandidate,
                  ),
                  SizedBox(
                    height: SizeConstants.sm.w,
                  ),
                  const Text(
                      "- Flutter Development: Lead the development of our compliance management mobile app using Flutter, adhering to best practices for performance, code quality, and maintainability.\n- UI/UX Implementation: Translate designs and wireframes into high-quality, user-friendly interfaces, with a focus on creating an exceptional user experience.\n- State Management: Implement efficient state management solutions (e.g., BLoC, Provider, Riverpod) to manage the application's data flow and responsiveness.\n- App Store Deployment: Manage the process of publishing the app to both the Apple App Store and Google Play Store, ensuring compliance with all guidelines and requirements.\n- Performance Optimization: Optimize the app's performance by identifying and addressing bottlenecks, ensuring a smooth and responsive user experience.")
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: SizeConstants.md.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleList(
                    title: StringConstants.benefit,
                  ),
                  SizedBox(
                    height: SizeConstants.sm.w,
                  ),
                  Text(jobModel.salary ?? "")
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: SizeConstants.md.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleList(
                    title: StringConstants.timeWork,
                  ),
                  SizedBox(
                    height: SizeConstants.sm.w,
                  ),
                  Text(jobModel.workingTime ?? "")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

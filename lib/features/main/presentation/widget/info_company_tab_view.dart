import 'package:app_flutter/features/main/presentation/widget/info_job_row.dart';
import 'package:app_flutter/share/utils/constants/icon_constants.dart';
import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:app_flutter/share/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoComapnyTabView extends StatelessWidget {
  const InfoComapnyTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: SizeConstants.lg.w, horizontal: SizeConstants.md.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lich viet",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: SizeConstants.md.w,
            ),
            const InfoShareRow(
                content:
                    '235A Ngô Thì Nhậm, Phường An Khánh, Quận Ninh Kiều, TP. Cần Thơ',
                icon: IconConstants.icLocation,
                title: StringConstants.addressCompany),
            const InfoShareRow(
              content: "https://vietnam",
              icon: IconConstants.icWebsite,
              title: StringConstants.websiteCompany,
            ),
            //  SizedBox(height:SizeConstants.md.w,),
            Text(
              StringConstants.introduceCompany,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: SizeConstants.sm.w,
            ),
            Text(
                "- Flutter Development: Lead the development of our compliance management mobile app using Flutter, adhering to best practices for performance, code quality, and maintainability.\n- UI/UX Implementation: Translate designs and wireframes into high-quality, user-friendly interfaces, with a focus on creating an exceptional user experience.\n- State Management: Implement efficient state management solutions (e.g., BLoC, Provider, Riverpod) to manage the application's data flow and responsiveness.\n- App Store Deployment: Manage the process of publishing the app to both the Apple App Store and Google Play Store, ensuring compliance with all guidelines and requirements.\n- Performance Optimization: Optimize the app's performance by identifying and addressing bottlenecks, ensuring a smooth and responsive user experience.")
          ],
        ),
      ),
    );
  }
}

import 'package:app_flutter/features/profile/presentation/widget/manage_job_item.dart';
import 'package:app_flutter/features/profile/presentation/widget/setting_profile_row.dart';
import 'package:app_flutter/share/utils/constants/icon_constants.dart';
import 'package:app_flutter/share/utils/constants/image_constants.dart';
import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:app_flutter/share/utils/constants/string_constants.dart';
import 'package:app_flutter/share/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // final dark = DeviceUtils.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: SizeConstants.lg.w +
                      DeviceUtils.getStatusBarHeight(context),
                  bottom: 50.w,
                  left: SizeConstants.md.w,
                  right: SizeConstants.md.w),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF1D50FF),
                  Theme.of(context).scaffoldBackgroundColor,
                ],
                stops: const [0.1725, 0.9982],
              )),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                height: 136,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    Image.asset(
                      ImageConstants.imgPerson,
                      width: 88.w,
                      height: 88.w,
                    ),
                    SizedBox(
                      width: SizeConstants.md.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Xin chào",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(
                          width: SizeConstants.sm.w,
                        ),
                        Text(
                          "Hoang Anh",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(
                          width: SizeConstants.md.w,
                        ),
                        Text(
                          "Mã ứng viên: 551550494",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            // SizedBox(height: SizeConstants.md.w,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConstants.md.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.manageFindJob,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: SizeConstants.sm.w,
                  ),
                  GridView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: SizeConstants.gridViewSpacing.w,
                      mainAxisSpacing: SizeConstants.gridViewSpacing.w,
                      mainAxisExtent: 140.w
                    ),
                    children: const [
                      ManageJobSettingItem(
                        title: StringConstants.jobApply,
                        icon: IconConstants.icJob,
                        number: 5,
                      ),
                      ManageJobSettingItem(
                        title: StringConstants.jobSave,
                        icon: IconConstants.icBookmarkSetting,
                        number: 5,
                      ),
                       ManageJobSettingItem(
                        title: StringConstants.jobSuit,
                        icon: IconConstants.icCheckCircle,
                        number: 5,
                      ),
                      ManageJobSettingItem(
                        title: StringConstants.companySave,
                        icon: IconConstants.icBookMarkCompany,
                        number: 5,
                      ),
                      ManageJobSettingItem(
                        title: StringConstants.recruiterSee,
                        icon: IconConstants.icEye,
                        number: 5,
                      ),
                     
                    ],
                    // gre
                  ),
                  SizedBox(
                    height: SizeConstants.md.w,
                  ),
                  Text(
                    StringConstants.setting,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: SizeConstants.sm.w,
                  ),
                  SettingProfileRow(
                    title: StringConstants.infoProfile,
                    icon: IconConstants.icLocation,
                    onPressed: () {
                      Modular.to.pushNamed("/profile/infoProfile");
                    },
                  ),
                  SettingProfileRow(
                    title: StringConstants.changePassword,
                    icon: IconConstants.icChangePass,
                    onPressed: () {},
                  ),
                  SettingProfileRow(
                    title: StringConstants.logout,
                    icon: IconConstants.icLogout,
                    onPressed: () {
                      Modular.to.navigate('/');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:app_flutter/features/main/presentation/widget/home_appbar.dart';
import 'package:app_flutter/features/main/presentation/widget/job_item_widget.dart';
import 'package:app_flutter/share/base_component/container/primary_header_container.dart';
import 'package:app_flutter/share/base_component/container/search_container.dart';
import 'package:app_flutter/share/base_component/text/title_list.dart';
import 'package:app_flutter/share/utils/constants/colors.dart';
import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:app_flutter/share/utils/constants/string_constants.dart';
import 'package:app_flutter/share/utils/dummy/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.softGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  const HomeAppBar(),
                  SizedBox(
                    height: SizeConstants.spaceBtwSections.w,
                  ),
                  const TSearchContainer(
                    text: StringConstants.homeSearchTitle,
                  ),
                  SizedBox(
                    height: SizeConstants.spaceBtwSections.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConstants.spaceBtwItems.w,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: SizeConstants.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleList(
                    title: StringConstants.hintSuitableJob,
                    showSeeAll: true,
                    onPressSeeAll: () => Modular.to.pushNamed(
                        "/home/see_all_job",
                        arguments: {"jobs": DummyData.listJobSuggest}),
                  ),
                  SizedBox(
                    height: SizeConstants.spaceBtwItems.w,
                  ),
                  ListView.builder(
                    itemCount: DummyData.listJobSuggest.length,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: EdgeInsets.only(
                              bottom:
                                  index != DummyData.listJobSuggest.length - 1
                                      ? SizeConstants.sm.w
                                      : 0),
                          child: JobItemWidget(
                            jobModel: DummyData.listJobSuggest[index],
                          ));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

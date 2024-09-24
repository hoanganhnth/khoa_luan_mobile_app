import 'package:app_flutter/features/main/bloc/all_job/all_job_cubit.dart';
import 'package:app_flutter/features/main/presentation/widget/home_appbar.dart';
import 'package:app_flutter/features/main/presentation/widget/job_item_widget.dart';
import 'package:app_flutter/features/main/presentation/widget/shimmer_list_job.dart';
import 'package:app_flutter/share/base_component/container/primary_header_container.dart';
import 'package:app_flutter/share/base_component/container/search_container.dart';
import 'package:app_flutter/share/base_component/text/title_list.dart';
import 'package:app_flutter/share/utils/constants/colors.dart';
import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:app_flutter/share/utils/constants/string_constants.dart';
import 'package:app_flutter/share/utils/cubit/loading_status.dart';
import 'package:app_flutter/share/utils/dummy/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin{
  late AllJobCubit jobCubit;
  @override
  void initState() {
    jobCubit = Modular.get<AllJobCubit>();
    jobCubit.getJob();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
            BlocBuilder<AllJobCubit, AllJobState>(
              bloc: jobCubit,
              builder: (context, state) {
                if (state.status == LoadingStatus.loading) {
                  return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: const ShimmerListJob());
                }
                if (state.listJobs == null) {
                  return const SizedBox.shrink();
                }
                if (state.status == LoadingStatus.success) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: SizeConstants.md),
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
                          itemCount: state.listJobs?.length,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                margin: EdgeInsets.only(
                                    bottom: index !=
                                            state.listJobs!.length - 1
                                        ? SizeConstants.sm.w
                                        : 0),
                                child: JobItemWidget(
                                  jobModel: state.listJobs![index],
                                ));
                          },
                        )
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}

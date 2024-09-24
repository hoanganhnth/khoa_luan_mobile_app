import 'package:app_flutter/features/main/bloc/company/company_cubit.dart';
import 'package:app_flutter/features/main/bloc/detail_job/detail_job_cubit.dart';
import 'package:app_flutter/features/main/data/model/job_model.dart';
import 'package:app_flutter/features/main/presentation/widget/info_company_tab_view.dart';
import 'package:app_flutter/features/main/presentation/widget/info_job_column.dart';
import 'package:app_flutter/features/main/presentation/widget/info_job_tab_view.dart';
import 'package:app_flutter/share/base_component/app_bar/appbar.dart';
import 'package:app_flutter/share/base_component/app_bar/tabbar.dart';
import 'package:app_flutter/share/base_component/button/custom_button.dart';
import 'package:app_flutter/share/base_component/container/circular_container.dart';
import 'package:app_flutter/share/base_component/image/image_container.dart';
import 'package:app_flutter/share/base_component/loading/custom_loading.dart';
import 'package:app_flutter/share/utils/constants/app_constants.dart';
import 'package:app_flutter/share/utils/constants/colors.dart';
import 'package:app_flutter/share/utils/constants/icon_constants.dart';
import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:app_flutter/share/utils/constants/string_constants.dart';
import 'package:app_flutter/share/utils/cubit/loading_status.dart';
import 'package:app_flutter/share/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

class DetailJobScreen extends StatefulWidget {
  const DetailJobScreen({super.key, required this.jobModel});
  final JobModel jobModel;

  @override
  State<DetailJobScreen> createState() => _DetailJobScreenState();
}

class _DetailJobScreenState extends State<DetailJobScreen> {
  List<String> category = ["Thông tin", "Công ty"];
  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 300;
  ValueNotifier<bool> isShrink = ValueNotifier(false);
  late DetailJobCubit jobCubit;
  late CompanyCubit companyCubit;
  void _scrollListener() {
    if (_isShrink != lastStatus) {
      lastStatus = _isShrink;
      isShrink.value = _isShrink;
    }
  }

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (height - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    jobCubit = Modular.get<DetailJobCubit>();
    companyCubit = Modular.get<CompanyCubit>();
    jobCubit.getJob(widget.jobModel.id ?? 0);
    companyCubit.getCompany(widget.jobModel.companyId ?? 0);
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = DeviceUtils.isDarkMode(context);
    final paddingBottom = DeviceUtils.getPaddingBottom(context);
    return BlocBuilder<DetailJobCubit, DetailJobState>(
      bloc: jobCubit,
      builder: (BuildContext context, DetailJobState state) {
        if (state.status == LoadingStatus.loading) {
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const CustomLoading());
        }
        if (state.job == null) {
          return const SizedBox.shrink();
        }
        if (state.status == LoadingStatus.success) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
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
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(SizeConstants.sm.w),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(SizeConstants.xs.w),
                          border: Border.all(
                              color: Theme.of(context).primaryColor)),
                      child: SvgPicture.asset(IconConstants.icBookMark,
                          width: 15.w,
                          height: 25.w,
                          color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      width: SizeConstants.md.w,
                    ),
                    CustomButton(
                      height: 42.w,
                      width: 320.w,
                      title: StringConstants.applyNow,
                      onPressed: () {
                        Modular.to.pushNamed("/apply_job",
                            arguments: {"job_id": widget.jobModel.id});
                      },
                    )
                  ],
                ),
              ),
              body: NestedScrollView(
                controller: _scrollController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      excludeHeaderSemantics: true,
                      automaticallyImplyLeading: false,
                      pinned: true,
                      // floating: true,
                      backgroundColor: DeviceUtils.isDarkMode(context)
                          ? ColorConstants.dark
                          : ColorConstants.white,
                      expandedHeight: 350.w,
                      title: ValueListenableBuilder(
                        valueListenable: isShrink,
                        builder:
                            (BuildContext context, bool value, Widget? child) {
                          if (!value) {
                            return const SizedBox();
                          }
                          return Text(
                            state.job?.title ?? "",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          );
                        },
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        background: Stack(
                          alignment: Alignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 200.w,
                                  color: ColorConstants.primary,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          top: -100.w,
                                          right: -50.w,
                                          child: TCircularContainer(
                                            radius: 200.w,
                                            width: 200.w,
                                            height: 200.w,
                                            backgroundColor: ColorConstants
                                                .textWhite
                                                .withOpacity(0.1),
                                          )),
                                      Positioned(
                                          top: 50.w,
                                          right: -100.w,
                                          child: TCircularContainer(
                                            backgroundColor: ColorConstants
                                                .textWhite
                                                .withOpacity(0.1),
                                          )),
                                      AppBarCustom(
                                        leadingOnPressed: () =>
                                            Modular.to.pop(),
                                        leadingIcon: const Icon(
                                            Iconsax.arrow_left,
                                            color: ColorConstants.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // color: Colors.grey,
                                  height: 150.w,
                                )
                              ],
                            ),
                            Positioned(
                              bottom: 0,
                              child: SizedBox(
                                // color: Colors.blueGrey,
                                height: 330.w,
                                // width: 50,s
                                width: AppConstants.widthScreen.w - 32.w,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      top: 40.w,
                                      child: Container(
                                        width:
                                            AppConstants.widthScreen.w - 32.w,
                                        padding: EdgeInsets.only(
                                            top: 50.w,
                                            left: SizeConstants.md.w,
                                            right: SizeConstants.md.w,
                                            bottom: SizeConstants.md.w),
                                        decoration: BoxDecoration(
                                          color: ColorConstants.white,
                                          borderRadius: BorderRadius.circular(
                                              SizeConstants.borderRadiusMd),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 0,
                                              blurRadius: 1,
                                              offset: const Offset(0, 1),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              state.job?.title ?? "",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              height: SizeConstants.sm.w,
                                            ),
                                            Text(
                                              state.job?.companyName ?? "",
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge,
                                            ),
                                            SizedBox(
                                              height: SizeConstants.sm.w,
                                            ),
                                            const Divider(
                                              color: ColorConstants.grey,
                                            ),
                                            SizedBox(
                                              height: SizeConstants.sm.w,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Flexible(
                                                  child: InfoJobColum(
                                                    content:
                                                        state.job?.salary ?? "",
                                                    imgUrl:
                                                        IconConstants.icMoney,
                                                    title: StringConstants
                                                        .salaryTitle,
                                                  ),
                                                ),
                                                Flexible(
                                                  child: InfoJobColum(
                                                    content: state.job
                                                            ?.locationName ??
                                                        "",
                                                    imgUrl: IconConstants
                                                        .icLocation,
                                                    title: StringConstants
                                                        .locationTitle,
                                                  ),
                                                ),
                                                const Flexible(
                                                  child: InfoJobColum(
                                                    content: "1 Năm",
                                                    imgUrl:
                                                        IconConstants.icStar,
                                                    title: StringConstants
                                                        .experience,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      // right: 0,
                                      // left: 0,
                                      child: ImageContainer(
                                        imageUrl: state.job?.imageUrl ?? "",
                                      ),
                                      // height: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      leading: ValueListenableBuilder(
                        valueListenable: isShrink,
                        builder:
                            (BuildContext context, bool value, Widget? child) {
                          if (!value) {
                            return const SizedBox();
                          }
                          return InkWell(
                            onTap: () => Modular.to.pop(),
                            child: Icon(Iconsax.arrow_left,
                                color: dark
                                    ? ColorConstants.white
                                    : ColorConstants.black),
                          );
                        },
                      ),
                      bottom: TTaBar(
                        tabs: category
                            .map((category) => Tab(
                                  child: Text(category),
                                ))
                            .toList(),
                      ),
                    )
                  ];
                },
                body: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    InfoJobTabView(
                      jobModel: state.job!,
                    ),
                    BlocBuilder<CompanyCubit, CompanyState>(
                      bloc: companyCubit,
                      builder: (context, state) {
                        if (state.status == LoadingStatus.loading) {
                          return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: const CustomLoading());
                        }
                        if (state.company == null) {
                          return const SizedBox.shrink();
                        }
                        if (state.status == LoadingStatus.success) {
                          return InfoComapnyTabView(
                            companyModel: state.company!,
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

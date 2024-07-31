import 'package:app_flutter/features/main/data/model/cv_model.dart';
import 'package:app_flutter/share/base_component/app_bar/appbar.dart';
import 'package:app_flutter/share/base_component/button/custom_button.dart';
import 'package:app_flutter/share/base_component/container/selected_container.dart';
import 'package:app_flutter/share/base_component/text/title_list.dart';
import 'package:app_flutter/share/utils/constants/app_constants.dart';
import 'package:app_flutter/share/utils/constants/colors.dart';
import 'package:app_flutter/share/utils/constants/icon_constants.dart';
import 'package:app_flutter/share/utils/constants/image_constants.dart';
import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:app_flutter/share/utils/constants/string_constants.dart';
import 'package:app_flutter/share/utils/device/device_utility.dart';
import 'package:app_flutter/share/utils/validators/validation.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

enum TypeSelectCV { none, myCV, upload }

class ApplyJobScreen extends StatefulWidget {
  const ApplyJobScreen({super.key, required this.jobId});
  final int jobId;

  @override
  State<ApplyJobScreen> createState() => _ApplyJobScreenState();
}

class _ApplyJobScreenState extends State<ApplyJobScreen> {
  ValueNotifier<TypeSelectCV> typeSelected = ValueNotifier(TypeSelectCV.none);
  ValueNotifier<int> indexSelectedjob = ValueNotifier(0);
  TextEditingController letterController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final dark = DeviceUtils.isDarkMode(context);
    final paddingBottom = DeviceUtils.getPaddingBottom(context);
    return Scaffold(
      appBar: AppBarCustom(
        centerTitle: true,
        showBackArrow: true,
        leadingOnPressed: () => Modular.to.pop(),
        title: const Text(StringConstants.apply),
      ),
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
            title: StringConstants.applyNow,
            onPressed: () {
              Modular.to.pushNamed("/success_apply",
                  );

            },
          )),
      body: 
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConstants.md.w, vertical: SizeConstants.md.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleList(
                title: StringConstants.cvApply,
              ),
              SizedBox(
                height: SizeConstants.md.w,
              ),
              ValueListenableBuilder(
                valueListenable: typeSelected,
                builder:
                    (BuildContext context, TypeSelectCV value, Widget? child) {
                  return SelectedContainer(
                    title: StringConstants.myCv,
                    selected: value == TypeSelectCV.myCV,
                    onPressed: (val) {
                      typeSelected.value = TypeSelectCV.myCV;
                    },
                    expandWidget: GestureDetector(
                      onTap: () => showListCV(context, indexSelectedjob.value),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConstants.md.w,
                            vertical: SizeConstants.sm.w),
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorConstants.grey),
                            borderRadius: BorderRadius.circular(
                                SizeConstants.borderRadiusMd.w)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ValueListenableBuilder(
                              valueListenable: indexSelectedjob,
                              builder: (BuildContext context, int value,
                                  Widget? child) {
                                return Text(
                                  listCvs[value].title ?? "",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                );
                              },
                            ),
                            SvgPicture.asset(
                              IconConstants.icArrowDown,
                              width: 12.w,
                              height: 12.w,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: SizeConstants.md.w,
              ),
              ValueListenableBuilder(
                valueListenable: typeSelected,
                builder:
                    (BuildContext context, TypeSelectCV value, Widget? child) {
                  return SelectedContainer(
                    title: StringConstants.uploadCv,
                    selected: value == TypeSelectCV.upload,
                    onPressed: (val) {
                      typeSelected.value = TypeSelectCV.upload;
                    },
                    expandWidget: DottedBorder(
                      borderType: BorderType.RRect,
                      color: Theme.of(context).primaryColor,
                      radius: Radius.circular(SizeConstants.borderRadiusMd.w),
                      padding: EdgeInsets.all(SizeConstants.md.w),
                      child: Container(
                        color: ColorConstants.white,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Image.asset(
                              ImageConstants.imgUpload,
                              width: 80.w,
                              height: 80.w,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              height: SizeConstants.md.w,
                            ),
                            Text(
                              StringConstants.clickToUpload,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            SizedBox(
                              height: SizeConstants.md.w,
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: StringConstants.supportPdf,
                                style: DefaultTextStyle.of(context)
                                    .style, // Sử dụng kiểu văn bản mặc định
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: AppConstants.sizeFileLimit,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: SizeConstants.md.w,
              ),
              const TitleList(
                title: StringConstants.letterIntroduce,
              ),
              SizedBox(
                height: SizeConstants.md.w,
              ),
              TextFormField(
                validator: (value) => TValidator.validatePassword(value),
                controller: letterController,
                maxLines: 3,
                // style: Theme.of(context).textTheme.titleMedium,
                decoration: InputDecoration(
                    // prefixIconConstraints:
                    //     BoxConstraints( maxWidth: 46.w, maxHeight: 90.w),
                    // prefixIcon: Container(
                    //   color: Colors.grey,
                    //   alignment: Alignment.topLeft,
                    //     padding: EdgeInsets.only(
                    //       left: 16.w,
                    //       right: 12.w,
                    //     ),
                    //     child: const Icon(Iconsax.send1)),
                    contentPadding:
                        EdgeInsets.only(left: 16.w, top: 20.w, bottom: 16.w),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(
                            SizeConstants.borderRadiusMd)),
                    hintText: StringConstants.introduceMySelf,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: ColorConstants.darkGrey)),
              )
            ],
          ),
        ),
      ),
    
    );
  }

  List<CVModel> listCvs = [
    CVModel(title: "CV 1", createdAt: "22/5/2001", updatedAt: "22/36/2001"),
    CVModel(title: "CV 2", createdAt: "22/5/2001", updatedAt: "22/36/2001"),
    CVModel(title: "CV 3", createdAt: "22/5/2001", updatedAt: "22/36/2001"),
    CVModel(title: "CV 4", createdAt: "22/5/2001", updatedAt: "22/36/2001"),
    CVModel(title: "CV 5", createdAt: "22/5/2001", updatedAt: "22/36/2001"),
  ];
  void showListCV(BuildContext context, int indexSelected) async {
    showModalBottomSheet(
      context: context,
      showDragHandle: false,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5, // Chiều cao ban đầu là nửa màn hình
          minChildSize: 0.5, // Chiều cao tối thiểu là nửa màn hình
          maxChildSize: 1.0,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              padding: EdgeInsets.only(top: SizeConstants.md.w),
              decoration: BoxDecoration(
                  color: ColorConstants.softGrey,
                  borderRadius:
                      BorderRadius.circular(SizeConstants.borderRadiusLg.w)),
              child: Column(
                children: [
                  Text(
                    StringConstants.myCv,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: SizeConstants.lg.w,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: listCvs.length,
                      controller: scrollController,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: ColorConstants.white,
                              borderRadius: BorderRadius.circular(
                                  SizeConstants.borderRadiusMd)),
                          margin: EdgeInsets.only(
                              left: SizeConstants.md.w,
                              right: SizeConstants.md.w,
                              bottom: SizeConstants.md.w),
                          child: InkWell(
                            onTap: () {
                              indexSelectedjob.value = index;
                              Modular.to.pop(context);
                            },
                            child: ListTile(
                              title: Text(
                                listCvs[index].title ?? '',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              subtitle: Text(
                                'Cập nhật lần cuối: ${listCvs[index].createdAt}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              leading: indexSelected == index
                                  ? const ContainerIconActive()
                                  : const ContainerIconNotActive(),
                              trailing: Text(
                                StringConstants.seeCv,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

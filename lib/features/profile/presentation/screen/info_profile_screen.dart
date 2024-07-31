import 'dart:io';

import 'package:app_flutter/share/base_component/app_bar/appbar.dart';
import 'package:app_flutter/share/base_component/image/image.dart';
import 'package:app_flutter/share/base_component/input/date_picker_field.dart';
import 'package:app_flutter/share/base_component/input/dropdown_button_field.dart';
import 'package:app_flutter/share/utils/constants/colors.dart';
import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:app_flutter/share/utils/constants/string_constants.dart';
import 'package:app_flutter/share/utils/validators/validation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class InfoProfileScreen extends StatefulWidget {
  const InfoProfileScreen({super.key});

  @override
  State<InfoProfileScreen> createState() => _InfoProfileScreenState();
}

class _InfoProfileScreenState extends State<InfoProfileScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  GlobalKey key = GlobalKey();
  final ImagePicker _imagePicker = ImagePicker();
  ValueNotifier<String> imgUrl = ValueNotifier("");
  File? _selectedImage;
  final List<String> genders = [StringConstants.male, StringConstants.female, StringConstants.other];
  String gender = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        centerTitle: true,
        showBackArrow: true,
        leadingOnPressed: () => Modular.to.pop(),
        title: const Text(StringConstants.infoProfile),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConstants.md.w),
            child: Column(
              children: [
                ValueListenableBuilder(
                  valueListenable: imgUrl,
                  builder: (BuildContext context, String? value, Widget? child) {
                    return GestureDetector(
                      onTap: _pickImage,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(400.w),
                            child: imageFromNetWork(
                              url:
                                  "https://cdn.pixabay.com/photo/2023/01/28/20/23/ai-generated-7751688_960_720.jpg",
                              height: 120.w,
                              width: 120.w,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(SizeConstants.sm.w),
                              decoration: BoxDecoration(
                                  border: Border.all(color: ColorConstants.white),
                                  color: ColorConstants.black,
                                  borderRadius: BorderRadius.circular(400)),
                              child: Center(
                                child: Icon(
                                  Iconsax.camera,
                                  size: 16.w,
                                  color: ColorConstants.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: SizeConstants.lg.w,
                ),
                TextFormField(
                  controller: userNameController,
                  validator: (value) =>
                      TValidator.validateEmptyText("User name", value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user_edit),
                      labelText: StringConstants.userName),
                ),
                SizedBox(
                  height: SizeConstants.md.w,
                ),
                TextFormField(
                  controller: emailController,
                  validator: (value) =>
                      TValidator.validateEmail("hoanganh"),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct),
                      labelText: StringConstants.email),
                ),
                SizedBox(
                  height: SizeConstants.md.w,
                ),
                TextFormField(
                  controller: userNameController,
                  validator: (value) =>
                      TValidator.validatePhoneNumber("0124566"),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.call),
                      labelText: StringConstants.phoneNo),
                ),
                SizedBox(
                  height: SizeConstants.md.w,
                ),
                 DatePickerField( 
                      value: '01/02/2002',
                      onChanged: (v) {
                        
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    DropdownButtonField(
                      onChanged: (v) {
                        
                      },
                      items: genders,
                      value: gender.isEmpty ? genders.first : gender,
                      
                    ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile =
          await _imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

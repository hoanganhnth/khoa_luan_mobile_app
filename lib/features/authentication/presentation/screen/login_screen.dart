import 'package:app_flutter/features/authentication/bloc/cubit/user_cubit.dart';
import 'package:app_flutter/features/authentication/presentation/widget/login_form.dart';
import 'package:app_flutter/features/authentication/presentation/widget/login_header.dart';
import 'package:app_flutter/share/base_component/loading/custom_loading.dart';
import 'package:app_flutter/share/base_component/style/spacing_style.dart';
import 'package:app_flutter/share/utils/cubit/loading_status.dart';
import 'package:app_flutter/share/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = DeviceUtils.isDarkMode(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<UserCubit, UserState>(
        listener: (BuildContext context, UserState state) {
          if (state.status == LoadingStatus.success) {
            Modular.to.pushNamed("/home/");
          }
        },
        bloc: Modular.get<UserCubit>(),
        builder: (context, state) {
          if (state.status == LoadingStatus.loading) {
            return const CustomLoading();
          }
          return Center(
            child: Container(
              // height: double.infinity,
              // color: Colors.grey,
              padding: SpacingStyle.paddingWithAppBarHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo, Title, Sub-title
                  TLoginHeader(dark: dark),
                  // Form
                  const TLoginForm(),
                  // Divider
                  // TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
                  // const SizedBox(height: TSizes.spaceBtwSections,),
                  // Footer
                  // const TSocialButtons()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

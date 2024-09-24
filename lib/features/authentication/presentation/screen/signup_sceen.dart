import 'package:app_flutter/features/authentication/bloc/signup/signup_cubit.dart';
import 'package:app_flutter/features/authentication/presentation/widget/signup_form.dart';
import 'package:app_flutter/share/base_component/app_toast/app_toast.dart';
import 'package:app_flutter/share/base_component/app_toast/src/model/data_alert.dart';
import 'package:app_flutter/share/base_component/loading/custom_loading.dart';
import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:app_flutter/share/utils/constants/string_constants.dart';
import 'package:app_flutter/share/utils/cubit/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = DeviceUtils.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<SignupCubit, SignupState>(
        bloc: Modular.get<SignupCubit>(),
        listener: (BuildContext context, SignupState state) {
          if (state.status == LoadingStatus.success) {
            Modular.to.navigate("/");
            AppToast.share.showToast(StringConstants.signupSuccess,
                type: ToastType.success);
          }
        },
        builder: (context, state) {
          if (state.status == LoadingStatus.loading) {
            return const CustomLoading();
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(SizeConstants.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Text(
                    StringConstants.signupTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),

                  // Form
                  const SignupForm(),

                  // Divider
                  // TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
                  // const SizedBox(height: TSizes.spaceBtwSections),

                  // // Footer
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

import 'package:app_flutter/features/authentication/presentation/widget/signup-form.dart';
import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:app_flutter/share/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = DeviceUtils.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
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
      ),
    );
  }
}

import 'package:app_flutter/share/utils/constants/colors.dart';
import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:app_flutter/share/utils/constants/string_constants.dart';
import 'package:app_flutter/share/utils/device/device_utility.dart';
import 'package:app_flutter/share/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
  });

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  // TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();
  ValueNotifier<bool> showPassword = ValueNotifier(false);
    ValueNotifier<bool> showPasswordAgain = ValueNotifier(false);

  ValueNotifier<bool> privacyPolicy = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final dark = DeviceUtils.isDarkMode(context);
    return Form(
        child: Padding(
      padding:
          const EdgeInsets.symmetric(vertical: SizeConstants.spaceBtwSections),
      child: Column(
        children: [
          // Firstname, Lastname
          // TextFormField(
          //   controller: fullNameController,
          //   validator: (value) =>
          //       TValidator.validateEmptyText("Full name", value),
          //   decoration: const InputDecoration(
          //       prefixIcon: Icon(Iconsax.user),
          //       labelText: StringConstants.fullName),
          // ),
          // const SizedBox(
          //   height: SizeConstants.spaceBtwInputFields,
          // ),
          // Username
          TextFormField(
            controller: userNameController,
            validator: (value) =>
                TValidator.validateEmptyText("User name", value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.user_edit),
                labelText: StringConstants.userName),
          ),
          const SizedBox(
            height: SizeConstants.spaceBtwInputFields,
          ),
          // email
          TextFormField(
            validator: (value) => TValidator.validateEmail(value),
            controller: emailController,
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct),
                labelText: StringConstants.email),
          ),
          const SizedBox(
            height: SizeConstants.spaceBtwInputFields,
          ),
          // phone, ...
          TextFormField(
            validator: (value) => TValidator.validatePhoneNumber(value),
            controller: phoneNumberController,
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.call),
                labelText: StringConstants.phoneNo),
          ),
          const SizedBox(
            height: SizeConstants.spaceBtwInputFields,
          ),
          // password, ...
          ValueListenableBuilder(
            valueListenable: showPassword,
            builder: (BuildContext context, bool value, Widget? child) {
              return TextFormField(
                validator: (value) => TValidator.validatePassword(value),
                controller: passwordController,
                obscureText: value,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.password_check),
                    labelText: StringConstants.password,
                    suffixIcon: IconButton(
                        onPressed: () => showPassword.value = !value,
                        icon: Icon(value ? Iconsax.eye_slash : Iconsax.eye))),
              );
            },
          ),
          const SizedBox(
            height: SizeConstants.spaceBtwInputFields,
          ),
          // password, ...
          ValueListenableBuilder(
            valueListenable: showPasswordAgain,
            builder: (BuildContext context, bool value, Widget? child) {
              return TextFormField(
                validator: (value) => TValidator.validatePassword(value),
                controller: passwordAgainController,
                obscureText: value,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.password_check),
                    labelText: StringConstants.passwordAgain,
                    suffixIcon: IconButton(
                        onPressed: () => showPasswordAgain.value = !value,
                        icon: Icon(value ? Iconsax.eye_slash : Iconsax.eye))),
              );
            },
          ),
          

          const SizedBox(
            height: SizeConstants.spaceBtwSections,
          ),
          // policy
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: ValueListenableBuilder(
                  valueListenable: privacyPolicy,
                  builder: (BuildContext context, bool value, Widget? child) {
                    return Checkbox(
                        value: value,
                        onChanged: (val) => privacyPolicy.value = !value);
                  },
                ),
              ),
              const SizedBox(width: SizeConstants.spaceBtwItems),
              Expanded(
                child: Text.rich(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    TextSpan(children: [
                      TextSpan(
                          text: StringConstants.iAgreeTo,
                          style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                          text: ' ${StringConstants.privacyPolicy} ',
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                color: dark
                                    ? ColorConstants.white
                                    : ColorConstants.primary,
                                decoration: TextDecoration.underline,
                                decorationColor: dark
                                    ? ColorConstants.white
                                    : ColorConstants.primary,
                              )),
                      TextSpan(
                          text: StringConstants.and,
                          style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                          text: ' ${StringConstants.termsOfUse} ',
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                color: dark
                                    ? ColorConstants.white
                                    : ColorConstants.primary,
                                decoration: TextDecoration.underline,
                                decorationColor: dark
                                    ? ColorConstants.white
                                    : ColorConstants.primary,
                              )),
                    ])),
              ),
            ],
          ),
          // button signup
          const SizedBox(height: SizeConstants.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // controller.signup();
                // Get.to(() => const VerifyEmailScreen());
              },
              child: const Text(StringConstants.signUp),
            ),
          ),
        ],
      ),
    ));
  }
}

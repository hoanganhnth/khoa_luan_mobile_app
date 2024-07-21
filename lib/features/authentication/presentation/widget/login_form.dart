import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:app_flutter/share/utils/constants/string_constants.dart';
import 'package:app_flutter/share/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iconsax/iconsax.dart';

class TLoginForm extends StatefulWidget {
  const TLoginForm({
    super.key,
  });

  @override
  State<TLoginForm> createState() => _TLoginFormState();
}

class _TLoginFormState extends State<TLoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> showPassword = ValueNotifier(false);
ValueNotifier<bool>  rememberPassword = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding:
          const EdgeInsets.symmetric(vertical: SizeConstants.spaceBtwSections),
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: StringConstants.email),
          ),
          const SizedBox(
            height: SizeConstants.spaceBtwInputFields,
          ),
           ValueListenableBuilder(
             valueListenable: showPassword,
             builder: (BuildContext context, bool value, Widget? child) { 
              return TextFormField(
                controller: passwordController,
                obscureText: showPassword.value,
                validator: (value) =>
                    TValidator.validateEmptyText('Password', value),
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.direct_right),
                    labelText: StringConstants.password,
                    suffixIcon: IconButton(
                        onPressed: () => showPassword.value = !value,
                        icon: Icon(value
                            ? Iconsax.eye_slash
                            : Iconsax.eye))),
              );
         
              },
           ),
       
          const SizedBox(
            height: SizeConstants.spaceBtwInputFields / 2,
          ),

          // Remember me
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                 ValueListenableBuilder(
                   valueListenable: rememberPassword,
                   builder: (BuildContext context, bool value, Widget? child) { 
                    return  Checkbox(
                        value: value,
                        onChanged: (val) => showPassword.value = !value);
                    },
         
                 ),
                  const Text(StringConstants.rememberMe)
                ],
              ),
              TextButton(
                  onPressed: () {
                    // Get.to(() => const ForgetPasswordScreen());
                  },
                  child: const Text(StringConstants.forgetPassword))
            ],
          ),
          const SizedBox(
            height: SizeConstants.spaceBtwSections,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Modular.to.pushNamed("/home");
                  },
                  child: const Text(StringConstants.signIn))),
          const SizedBox(
            height: SizeConstants.spaceBtwItems,
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () {
                  Modular.to.pushNamed("/authentication/signUp");
                },
                child: const Text(StringConstants.signUp)),
          ),
          const SizedBox(
            height: SizeConstants.spaceBtwSections,
          ),
        ],
      ),
    ));
  }
}

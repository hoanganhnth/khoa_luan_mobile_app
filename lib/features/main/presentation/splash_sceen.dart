import 'package:app_flutter/features/profile/bloc/cubit/user_cubit.dart';
import 'package:app_flutter/navigate/router.dart';
import 'package:app_flutter/share/base_component/loading/custom_loading.dart';
import 'package:app_flutter/share/utils/cubit/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      bloc: Modular.get<UserCubit>(),
      builder: (context, state) {
        return const CustomLoading();
      },
      listener: (BuildContext context, UserState state) {
        if (state.status == LoadingStatus.success) {
          Modular.to.navigate(RouterName.home);
        } else if (state.status == LoadingStatus.failure) {
          Modular.to.navigate(RouterName.home);
        }
      },
    );
  }
}

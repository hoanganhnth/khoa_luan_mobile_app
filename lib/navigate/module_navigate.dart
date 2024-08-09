import 'package:app_flutter/features/authentication/bloc/cubit/user_cubit.dart';
import 'package:app_flutter/features/authentication/data/datasource/authen_local_datasourse.dart';
import 'package:app_flutter/features/authentication/data/datasource/authen_remote_datasourse.dart';
import 'package:app_flutter/features/authentication/presentation/screen/login_screen.dart';
import 'package:app_flutter/features/authentication/presentation/screen/signup_sceen.dart';
import 'package:app_flutter/features/main/presentation/main_screen.dart';
import 'package:app_flutter/features/main/presentation/screen/all_job_screen.dart';
import 'package:app_flutter/features/main/presentation/screen/apply_job_screen.dart';
import 'package:app_flutter/features/main/presentation/screen/apply_job_success.dart';
import 'package:app_flutter/features/main/presentation/screen/detail_job_screen.dart';
import 'package:app_flutter/features/profile/presentation/screen/info_profile_screen.dart';
import 'package:app_flutter/features/profile/presentation/screen/profile_screen.dart';
import 'package:app_flutter/share/utils/helpers/api/api_handler.dart';
import 'package:app_flutter/share/utils/helpers/api/api_handler_impl.dart';
import 'package:app_flutter/share/utils/helpers/api/dio_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModule extends Module {
  final SharedPreferences _sharedPreferences;

  // final SharedPreferences _sharedPreferences;
  AppModule(this._sharedPreferences);

  @override
  void binds(Injector i) {
    i.addLazySingleton<SharedPreferences>(() => _sharedPreferences);
    i.addSingleton(() => DioApi());
    

    i.addSingleton(
        () => AuthenLocalDatasourse(Modular.get<SharedPreferences>()));

    // i.addLazySingleton<ApiHandler>(() => ApiHandlerImpl(Modular.get<DioApi>()));
    i.addSingleton(() => AuthenRemoteDataSourse());
    i.addLazySingleton(() => UserCubit(Modular.get<AuthenRemoteDataSourse>(),
        Modular.get<AuthenLocalDatasourse>()));

    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.redirect('/', to: '/authentication/signIn');

    r.module('/home', module: HomeModule());

    r.module('/authentication', module: AuthenModule());
    r.module('/profile', module: ProfileModule());
    r.child('/detail_job',
        child: (context) => DetailJobScreen(
              jobModel: r.args.data["job_model"],
            ));
    r.child('/apply_job',
        child: (context) => ApplyJobScreen(
              jobId: r.args.data["job_id"],
            ));
    r.child('/success_apply', child: (context) => const ApplyJobSuccess());

    super.routes(r);
  }
}

class HomeModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const MainScreen());
    r.child('/see_all_job',
        child: (context) => AllJobScreen(
              listJobs: r.args.data["jobs"],
            ));
  }
}

class AuthenModule extends Module {
  @override
  void binds(i) {}

  // @override
  // void exportedBinds(i) {
  // }

  @override
  void routes(r) {
    r.child(
      '/signIn',
      child: (context) => const SignInScreen(),
    );
    r.child(
      '/signUp',
      child: (context) => const SignupScreen(),
    );
  }
}

class ProfileModule extends Module {
  @override
  void binds(i) {}

  // @override
  // void exportedBinds(i) {
  // }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const ProfileScreen(),
    );
    r.child(
      '/infoProfile',
      child: (context) => const InfoProfileScreen(),
    );
  }
}

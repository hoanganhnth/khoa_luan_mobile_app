import 'package:app_flutter/features/authentication/bloc/signup/signup_cubit.dart';
import 'package:app_flutter/features/authentication/bloc/user/sign_in_cubit.dart';
import 'package:app_flutter/features/authentication/data/datasource/authen_local_datasourse.dart';
import 'package:app_flutter/features/authentication/data/datasource/authen_remote_datasourse.dart';
import 'package:app_flutter/features/authentication/presentation/screen/login_screen.dart';
import 'package:app_flutter/features/authentication/presentation/screen/signup_sceen.dart';
import 'package:app_flutter/features/main/bloc/all_job/all_job_cubit.dart';
import 'package:app_flutter/features/main/bloc/company/company_cubit.dart';
import 'package:app_flutter/features/main/bloc/detail_job/detail_job_cubit.dart';
import 'package:app_flutter/features/main/data/datasource/job_remote_datasource.dart';
import 'package:app_flutter/features/main/presentation/main_screen.dart';
import 'package:app_flutter/features/main/presentation/screen/all_job_screen.dart';
import 'package:app_flutter/features/main/presentation/screen/apply_job_screen.dart';
import 'package:app_flutter/features/main/presentation/screen/apply_job_success.dart';
import 'package:app_flutter/features/main/presentation/screen/detail_job_screen.dart';
import 'package:app_flutter/features/main/presentation/splash_sceen.dart';
import 'package:app_flutter/features/profile/bloc/cubit/user_cubit.dart';
import 'package:app_flutter/features/profile/data/datasource/user_remote_datasource.dart';
import 'package:app_flutter/features/profile/presentation/screen/info_profile_screen.dart';
import 'package:app_flutter/features/profile/presentation/screen/profile_screen.dart';
import 'package:app_flutter/navigate/router.dart';
import 'package:app_flutter/share/base_component/webview/webview_screen.dart';
import 'package:app_flutter/share/utils/helpers/api/dio_api.dart';
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
    i.addSingleton(() => AuthenRemoteDataSource());
    i.addLazySingleton(() => SignInCubit(Modular.get<AuthenRemoteDataSource>(),
        Modular.get<AuthenLocalDatasourse>()));
    i.addLazySingleton(() => SignupCubit(
          Modular.get<AuthenRemoteDataSource>(),
        ));
    i.addSingleton(() => UserRemoteDataSource());
    i.addLazySingleton(() => UserCubit(
          Modular.get<UserRemoteDataSource>(),
        ));
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.redirect('/', to: RouterName.splash);

    r.module(RouterName.home, module: HomeModule());

    r.module(RouterName.authen, module: AuthenModule());
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
    r.child(
      RouterName.webviewRouter,
      child: (context) => WebviewScreen(url: r.args.data["url"]),
    );
    r.child(
      RouterName.splash,
      child: (context) => const SplashScreen(),
    );
    super.routes(r);
  }
}

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(() => JobRemoteDatasource());
    i.addLazySingleton(() => AllJobCubit(Modular.get<JobRemoteDatasource>()));
    i.add(() => DetailJobCubit(Modular.get<JobRemoteDatasource>()));
    i.add(() => CompanyCubit(Modular.get<JobRemoteDatasource>()));
  }

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
      RouterName.signin,
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

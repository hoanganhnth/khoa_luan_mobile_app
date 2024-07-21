import 'package:app_flutter/features/authentication/presentation/screen/login_screen.dart';
import 'package:app_flutter/features/authentication/presentation/screen/signup_sceen.dart';
import 'package:app_flutter/features/main/main_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  // final SharedPreferences _sharedPreferences;
  AppModule();

  @override
  void binds(Injector i) {
    // TODO: implement binds
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.redirect('/', to: '/authentication/signIn');

    r.module('/home', module: HomeModule());

    r.module('/authentication', module: AuthenModule());
    super.routes(r);
  }
}

class HomeModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const MainScreen());
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

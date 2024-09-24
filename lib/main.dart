import 'package:app_flutter/features/profile/bloc/cubit/user_cubit.dart';
import 'package:app_flutter/navigate/module_navigate.dart';
import 'package:app_flutter/share/base_component/app_toast/app_toast.dart';
import 'package:app_flutter/share/utils/constants/app_constants.dart';
import 'package:app_flutter/share/utils/helpers/api/dio_api.dart';
import 'package:app_flutter/share/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sf = await SharedPreferences.getInstance();

  runApp(ModularApp(module: AppModule(sf), child: const MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Modular.get<DioApi>().init();
      Modular.get<UserCubit>().getProfile(onFinishGetUerInfo: () {
        Modular.to.navigate("/home");
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          const Size(AppConstants.widthScreen, AppConstants.heightScreen),
      child: MaterialApp.router(
        title: 'Global jobs',
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        routerConfig: Modular.routerConfig,
        builder: EasyLoading.init(builder: (context, child) {
          final mediaQueryData = MediaQuery.of(context);
          final scale = mediaQueryData.textScaler
              .clamp(minScaleFactor: 1, maxScaleFactor: 1.05);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: scale),
            child: KeyboardDismissOnTap(
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: Stack(
                  children: [
                    child!,
                    AppToast.share.getInstToInject(context),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
